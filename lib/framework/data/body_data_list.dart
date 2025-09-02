import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ui/utils/consts/colors/colors.dart';

List bodyDataList=[
  ListView.separated(
    shrinkWrap: true  ,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text("ListTitle"),
        leading: Container(
          height: 100,
          width: 100,
          padding: EdgeInsetsGeometry.all(5),
          decoration: BoxDecoration(color: AppColors.secondary),
        ),
      );
    },
    separatorBuilder: (context, index) {
      return SizedBox(height: 8);
    },
    itemCount: 10,
  ),
  Container(),
  Container()
];