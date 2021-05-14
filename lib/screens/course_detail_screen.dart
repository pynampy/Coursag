import 'package:coursag/helpers/size_config.dart';
import 'package:coursag/widgets/course_card.dart';
import 'package:coursag/widgets/detail_box.dart';

import 'package:flutter/material.dart';

import '../Providers/course.dart';
import '../widgets/my_separator.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseDetailScreen extends StatelessWidget {
  static const route = '/course-detail-screen';

  @override
  Widget build(BuildContext context) {
    Course singleCourse = ModalRoute.of(context).settings.arguments;
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.pink,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              Positioned(
                // top: 0,
                // left: 0,
                height: SizeConfig.safeAreaVertical * 210 / 949,
                width: SizeConfig.screenWidth,
                child: Container(
                  color: Colors.blue,
                  child:
                      Image.network(singleCourse.imageUrl, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: SizeConfig.safeAreaVertical * 210 / 949 - 20,
                height: SizeConfig.safeAreaVertical * 739 / 949 + 20,
                width: SizeConfig.screenWidth,
                left: 0,
                child: Container(
                  height: SizeConfig.screenHeight / 949 * 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            height: SizeConfig.screenHeight / 949 * 110,
                            width: SizeConfig.screenWidth,
                            margin: EdgeInsets.only(
                              top: SizeConfig.screenHeight * 25 / 949,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.screenWidth * 15 / 340,
                                vertical: SizeConfig.screenHeight * 5 / 949),
                            child: CourseCard(singleCourse, 0, Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20,
                            left: SizeConfig.screenWidth * 0.09,
                            right: SizeConfig.screenWidth * 0.09),
                        child: const MySeparator(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DetailBox(
                            singleCourse: singleCourse,
                            icon: Icons.timer,
                            isDuration: true,
                          ),
                          DetailBox(
                            singleCourse: singleCourse,
                            icon: Icons.border_color,
                            isDuration: false,
                          ),
                        ],
                      ),
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left : 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("About this course",
                                      style: TextStyle(
                                          color: const Color(0xff333e49),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Inter",
                                          fontStyle: FontStyle.normal,
                                          fontSize: SizeConfig.safeAreaVertical *
                                              0.018),
                                      textAlign: TextAlign.left),
                                  Flexible(
                                                                      child: Text(
                                        singleCourse.summary,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(

                                            color: Color(0xff333e49),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontStyle: FontStyle.normal,
                                            fontSize: SizeConfig.safeAreaVertical *
                                                0.018),
                                        textAlign: TextAlign.left),
                                  )
                                ]),
                          ),
                          margin: EdgeInsets.only(
                              top: SizeConfig.safeAreaVertical * 0.05),
                          width: SizeConfig.screenWidth * 290 / 340,
                          height: 131,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x17000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 4,
                                    spreadRadius: 0)
                              ],
                              color: const Color(0xffffffff))),
                              Container(
                        margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical*1 ),
                        width: SizeConfig.screenWidth * 290/340,
                        height: SizeConfig.blockSizeVertical*5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            color: const Color(0xff1e487b)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[

                               Padding(
                                 padding: EdgeInsets.only(
                                   right: SizeConfig.screenWidth * 80/340,
                                 ),
                                 child: Text("GO TO COURSE",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                   color: Colors.white
                                 ),
                                 ),
                               ), 
                               Container(
                                  width: SizeConfig.blockSizeVertical*5,
                                  height: SizeConfig.blockSizeVertical*5,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                      color: const Color.fromRGBO(0, 0, 0, 0.3)),
                                      child: IconButton(
                                        iconSize: SizeConfig.blockSizeHorizontal*5,
                                        color: Colors.white,
                                        icon: Icon(Icons.arrow_forward), onPressed: () async {
                                          var url = singleCourse.courseUrl;
                                          if (await canLaunch(url)){
                                            await launch(url);
                                          }
                                          else{
                                            print("Can not find url");
                                          }
                                          
                                        }), 
                                      ),
                            
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
