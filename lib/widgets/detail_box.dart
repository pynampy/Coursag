import 'package:coursag/Providers/course.dart';
import 'package:flutter/material.dart';
import '../helpers/size_config.dart';

class DetailBox extends StatelessWidget {

  final Course singleCourse;
  final IconData icon;
  final bool isDuration;
  DetailBox({this.singleCourse , this.icon, this.isDuration});

  @override
  Widget build(BuildContext context) {
    var duration = singleCourse.duration;
    duration = duration.split(' ')[0];
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
          top: SizeConfig.screenHeight * 0.04,
          left: SizeConfig.screenHeight * 0.01,
          right: SizeConfig.screenHeight * 0.01),
      width: SizeConfig.screenWidth * 125 / 340,
      height: SizeConfig.safeAreaVertical * 150 / 949,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        border: Border.all(color: const Color(0xff1e487b), width: 0.5),
        color: const Color(0xfff7fafe),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          top: 15,
          bottom: 15,
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon, 
            size: 50,
            color: const Color(0xff1e487b)
            ),
            Text( isDuration? '$duration Hr': "All",
                style:  TextStyle(
                    color: const Color(0xff1e487b),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Inter",
                    fontStyle: FontStyle.normal,
                    fontSize: SizeConfig.safeAreaVertical * 0.03),
                textAlign: TextAlign.center),
            Text(isDuration? 'Total Watch Hours' : 'Suitable for All levels',
                style: TextStyle(
                    color: const Color(0xff1e487b),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Inter",
                    fontStyle: FontStyle.normal,
                    fontSize: SizeConfig.safeAreaVertical * 0.015),
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
