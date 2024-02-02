import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatty/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../index.dart';
import 'chat_left_list.dart';
import 'chat_right_list.dart';

class ChatList extends GetView<ChatController> {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        color: AppColors.primaryBackground,
        padding: EdgeInsets.only(bottom: 70.h),
        child:GestureDetector(
          child:CustomScrollView(
              reverse: true,
              controller: controller.myScrollController,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0.w,
                    horizontal: 0.w,
                  ),
                  sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (content, index) {
                          var item = controller.state.msgcontentList[index];
                          if(controller.token==item.token){
                            return ChatRightItem(item);
                          }
                          return ChatLeftList(item);
                        },
                        childCount: controller.state.msgcontentList.length,
                      )
                  ),
                ),
              ]),
          onTap: () {
            // controller.close_all_pop();
          },
        ))
    );
  }
}