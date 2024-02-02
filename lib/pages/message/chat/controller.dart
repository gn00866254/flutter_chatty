import 'package:chatty/common/entities/entities.dart';
import 'package:chatty/common/routes/names.dart';
import 'package:chatty/common/store/store.dart';
import 'package:chatty/common/widgets/toast.dart';
import 'package:chatty/pages/message/chat/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatController();

  final state = ChatState();
  late String doc_id;
  final myInputController = TextEditingController();
  final token = UserStore.to.profile.token;
  final db = FirebaseFirestore.instance;
  var listener;
  var isLoadmore = true;

  ScrollController myScrollController = ScrollController();

  void goMore() {
    state.more_status.value = state.more_status.value ? false : true;
  }

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    print(data);
    doc_id = data['doc_id']!;
    state.to_token.value = data['to_token'] ?? '';
    state.to_name.value = data['to_name'] ?? '';
    state.to_avatar.value = data['to_avatar'] ?? '';
    state.to_online.value = data['to_online'] ?? '1';
  }
  
  @override
  void onReady(){
    super.onReady();
    print("Is's onReady");
    state.msgcontentList.clear();
    final messages = db.collection("message")
          .doc(doc_id)
          .collection("msglist")
          .withConverter(
            fromFirestore: Msgcontent.fromFirestore,
            toFirestore: (Msgcontent msg, options)=> msg.toFirestore())
          .orderBy("addtime", descending:  true).limit(15);

    listener = messages.snapshots().listen((event) {

      List<Msgcontent> temgMsgList = <Msgcontent>[];

      for (var change in event.docChanges){
        switch(change.type){
          case DocumentChangeType.added:
            if (change.doc.data()!=null){
              temgMsgList.add(change.doc.data()!);
              print("${change.doc.id}");
            }
            break;
          case DocumentChangeType.modified:
            // TODO: Handle this case.
            break;
          case DocumentChangeType.removed:
            // TODO: Handle this case.
            break;
        }
      }

      temgMsgList.reversed.forEach((element) {
        state.msgcontentList.value.insert(0, element);
      });

      state.msgcontentList.refresh();
      if (myScrollController.hasClients){
        myScrollController.animateTo(
          myScrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,);
      }

    });

    myScrollController.addListener((){
      if((myScrollController.offset + 20)>myScrollController.position.maxScrollExtent){
        if(isLoadmore){
          state.isloading.value = true;
          isLoadmore = false;
          asyncLoadMoreData(state.msgcontentList.length);
        }

      }
    });
  }

  Future<void> asyncLoadMoreData(int page) async{
    final messages = await db.collection("message")
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
          fromFirestore: Msgcontent.fromFirestore,
          toFirestore: (Msgcontent msgcontent, options) => msgcontent.toFirestore(),
    ).orderBy("addtime", descending: true).where(
        "addtime", isLessThan: state.msgcontentList.value.last.addtime
    ).limit(10).get();
    print(state.msgcontentList.value.last.content);
    print("isGreaterThan-----");
    if(messages.docs.isNotEmpty){
      messages.docs.forEach((element) {
        var data = element.data();
        state.msgcontentList.value.add(data);
        print(data.content);
      });
    }
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      print(timeStamp);
      isLoadmore = true;
    });
    state.isloading.value = false;

  }

  Future<void> sendMessage() async {
    String sendContent = myInputController.text;
    // print("tapped $sendContent message");
    if (sendContent.isEmpty){
      toastInfo(msg: "content is empty");
      return;
    }

    final content = Msgcontent(
      token: token,
      content: sendContent,
      type: "text",
      addtime: Timestamp.now()
    );

    await db.collection("message").doc(doc_id).collection("msglist")
    .withConverter(
        fromFirestore: Msgcontent.fromFirestore,
        toFirestore: (Msgcontent msg, options)=>msg.toFirestore()
    ).add(content).then((DocumentReference doc){
      // print(doc.id);
      myInputController.clear();
    });

    var messageResult = await db.collection("message").doc(doc_id)
        .withConverter(
        fromFirestore: Msg.fromFirestore,
        toFirestore: (Msg msg, options)=>msg.toFirestore()
    ).get();
    // to know if we have any unread msgs or cals
    if(messageResult.data()!=null){
      var item = messageResult.data();
      int? to_msg_num = item?.to_msg_num==null?0:item?.to_msg_num!;
      int? from_msg_num = item?.from_msg_num==null?0:item?.from_msg_num!;
      if (item?.from_token == token) {
        to_msg_num = 0;
      } else {
        from_msg_num = 0;
      }
      await db.collection("message").doc(doc_id).update(
          {
            "to_msg_num":to_msg_num,
            "from_msg_num":from_msg_num,
            "last_msg": sendContent,
            "last_time": Timestamp.now()
          }
      );
    }
  }

  @override
  void onClose(){
    super.onClose();
    // キャンセルしないとそのまま残ってしまう。
    listener.cancel();
    myInputController.dispose();
    myScrollController.dispose();
  }

}
