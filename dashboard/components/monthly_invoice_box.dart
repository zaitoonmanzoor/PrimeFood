import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class MonthlyWidget extends StatelessWidget {
  const MonthlyWidget({Key? key , this.text ,this.text2 ,this.svg}) : super(key: key);
  final String? text;
  final double? text2;
  final svg;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 85,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin:EdgeInsets.all(defaultPadding * 0.65) ,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  svg,
                  //  width: 30,
                  //height: 30,
                  //   fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: leftPadding , right: leftPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$text' ,textAlign: TextAlign.center, style: ktwelve),
                Text('$text2' ,textAlign: TextAlign.center, style: ktwelve),
              ],
            ),
          ),
        ],
      ),
    );
  }
}