import 'package:coursag/screens/category_detail_screen.dart';
import 'package:coursag/screens/course_detail_screen.dart';
import 'package:coursag/screens/home_screen.dart';
import 'package:coursag/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/courses.dart';
import 'package:coursag/screens/Question_screen.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider(create: (ctx) => Courses())
      ],
      child: MaterialApp(
      title: 'Coursag',
      home: SplashScreen(),
      routes: {
        HomeScreen.route: (ctx) => HomeScreen(),
        CategoryDetailScreen.route: (ctx) => CategoryDetailScreen(),
        CourseDetailScreen.route: (ctx) => CourseDetailScreen(),
        QuestionScreen.pageName: (ctx) => QuestionScreen(),
      },
    ),
    ); 
  }
}


