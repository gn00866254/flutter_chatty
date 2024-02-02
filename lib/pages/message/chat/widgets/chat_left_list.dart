import 'package:chatty/common/routes/names.dart';
import 'package:chatty/common/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chatty/common/entities/entities.dart';
import 'package:chatty/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

Widget ChatLeftList(Msgcontent item) {
  return Container(
    padding: EdgeInsets.only(top: 10.w, left: 20.w, right: 20.w,bottom: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: 250.w, //
                minHeight: 40.w //
            ),
            child:Column(
              mainAxisAlignment:MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 0.w,top: 0.w),
                  padding: EdgeInsets.only(
                      top: 10.w, bottom: 10.w, left: 10.w, right: 10.w),
                  decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.all(Radius.circular(5.w)),
                  ),
                  child: item.type=="text"? Text("${item.content}"):ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 90.w, //
                      ),
                      child:GestureDetector(
                        child: CachedNetworkImage(imageUrl:"${item.content}"),
                        onTap: () {
                          Get.toNamed(AppRoutes.Photoimgview,parameters: {"url": item.content??""});
                        },
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: Text(
                      item.addtime == null? "" : duTimeLineFormat((item.addtime as Timestamp).toDate()),
                      style: TextStyle(fontSize: 10.sp, color: AppColors.primarySecondaryElementText)
                  ),)
              ],)),
      ],
    ),
  );
}