import 'package:flutter/material.dart';
import 'package:pro_a/src/core/utilities/size-config.dart';

import '../core/constants/app_color.dart';
import '../core/constants/app_icon.dart';

class ProductWidget extends StatelessWidget {
  var item;
   ProductWidget({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical! * 1),
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal! * 4,
          vertical: SizeConfig.safeBlockVertical! * 1),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.blackColor),
          borderRadius:
              BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 8)),
      child: Row(
        children: [
          Column(children: [
            Image.asset(
              item['icon'],
              width: SizeConfig.safeBlockHorizontal! * 8,
            ),
          ]),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 3,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(item['name'],
                style: TextStyle(
                    color: AppColor.blackColor,
                    fontSize: SizeConfig.safeBlockHorizontal! * 4,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 0.5,
            ),
            Text(
              item['date'],
              style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: SizeConfig.safeBlockHorizontal! * 3,
                  fontWeight: FontWeight.w400),
            )
          ]),
          Spacer(),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              item['price'],
              style: TextStyle(
                  color: AppColor.redColor,
                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 0.5,
            ),
            Text(
              item['hashNo'],
              style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: SizeConfig.safeBlockHorizontal! * 3,
                  fontWeight: FontWeight.w400),
            ),
          ]),
        ],
      ),
    );
  }
}
