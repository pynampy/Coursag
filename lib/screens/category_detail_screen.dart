import 'package:coursag/Providers/course.dart';
import 'package:flutter/material.dart';
import '../helpers/size_config.dart';
import '../widgets/course_card.dart';

import '../Providers/courses.dart';
import 'package:provider/provider.dart';
import 'course_detail_screen.dart';

class CategoryDetailScreen extends StatelessWidget {
  static const route = '/category-detail-screen';

  @override
  Widget build(BuildContext context) {

    var searchField = ModalRoute.of(context).settings.arguments as String;
    if (searchField.contains('\n')) {
      searchField = searchField.replaceAll('\n', ' ');}
    // = Provider.of<Courses>(context, listen: false).queryCourse;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '$searchField courses',
            overflow: TextOverflow.clip,
          ),
          backgroundColor: Color.fromRGBO(30, 72, 123, 1),
        ),



        body: FutureBuilder(
          future: Provider.of<Courses>(context,listen: false).fetchCourses(searchField),
          builder: (ctx, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator());
            }else{
              final resultCourses = snapshot.data;
       
              return resultCourses.length == 0? 
              Center(
                child: Text("No courses found")
              ):
              ListView.builder(
          itemCount: resultCourses.length,
          itemBuilder: (context, index) {
            return Container(
              height: SizeConfig.screenHeight / 949 * 90,
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 15 / 340,
                  vertical: SizeConfig.screenHeight * 5 / 949),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(CourseDetailScreen.route, arguments: resultCourses[index]);
                },
                child: CourseCard(resultCourses[index],2.5,Color.fromRGBO(247, 250, 254, 1))),
            );
          },
        );

            }
          }
        )
        
      ),
    );
  }
}




