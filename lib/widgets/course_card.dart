import 'package:coursag/Providers/course.dart';
import 'package:flutter/material.dart';
import '../helpers/size_config.dart';
import './review_row.dart';


class CourseCard extends StatelessWidget {
  
  final Course singleCourse;
  final double elevation;
  final Color color;
  CourseCard(this.singleCourse, this.elevation, this.color);
  

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: elevation,
        color: color,
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.all(
                    SizeConfig.screenHeight * 10 / 949),
                height: SizeConfig.screenHeight * 67 / 949,
                width: SizeConfig.screenHeight * 87 / 949 * 0.7,
                child: Image.network(
                  singleCourse.imageUrl,
                  fit: BoxFit.cover,
                )),
            Column(
              children: [
                Container(
                  //color: Colors.pink,
                  margin: EdgeInsets.only(
                      top: SizeConfig.screenHeight * 10 / 949,
                      left: SizeConfig.screenHeight * 10 / 949),
                  width: SizeConfig.screenWidth * 150 / 340,
                  height: SizeConfig.screenWidth * 25 / 340,
                  child: Text(singleCourse.title,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: const Color(0xff333e49),
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter",
                        fontStyle: FontStyle.normal,
                        fontSize:
                            (SizeConfig.screenHeight / 949) * 12,
                      ),
                      textAlign: TextAlign.left),
                ),
                ReviewRow(singleCourse.reviews,singleCourse.numberOfReviews)
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.screenHeight * 10 / 949,
                left: SizeConfig.screenWidth * 30 / 340    
                    )
              ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${singleCourse.price} ",
                      style:  TextStyle(
                          color: const Color(0xff1e487b),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Inter",
                          fontStyle: FontStyle.normal,
                          fontSize: SizeConfig.screenHeight * 18 / 949
                          
                          ),
                      textAlign: TextAlign.left),
                      Spacer(),
                      Container(
                        //color: Colors.blue,
                        height: SizeConfig.screenHeight * 20/949,
                        width: SizeConfig.screenWidth* 50/340,
                        child: Image.network(singleCourse.companyLogo,
                        fit: BoxFit.cover,
                        ))
                ],
              ),
            ),
          ],
        ));
  }
}
