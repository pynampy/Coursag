import 'package:flutter/material.dart';
import 'package:coursag/screens/category_detail_screen.dart';


class QuestionScreen extends StatefulWidget {

  static const pageName = "/QuestionsScreen";
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      SingleChildScrollView(
              child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Which type of course, free,  paid or doesn't matter?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
           Padding(
             padding: EdgeInsets.only(
                   
                    left: 70,
                   top: 40,
                    bottom: 40
                    ),
             child:  TextField(
               decoration: InputDecoration(

                        hintText: "Enter your input",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey))
            ), 
           ),
            Text("Which topic you want to study?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            
            
            ),
            
           Padding(
             padding: EdgeInsets.only(
                    left: 70,
                    top: 40,
                    bottom: 40
                    ),
             child:  TextField(
               decoration: InputDecoration(
                        hintText: "Enter your input",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey))
            ), 
           ),
            Text("Your current level of expertise?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            
            ),
            
           Padding(
             padding: EdgeInsets.only(
                   
                    left: 70,
                    top: 40,
                    bottom: 40
                    ),
             child:  TextField(
               decoration: InputDecoration(

                        hintText: "Enter your input",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey))
            ), 
           ),
            Text("Any preferences for platform?", 
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
           Padding(
             padding: EdgeInsets.only(      
                    left: 70,
                    top: 40,
                    bottom: 40
                    ),
             child:  TextField(
               decoration: InputDecoration(
                        hintText: "Enter your input",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey))
            ), 
           ),
           ElevatedButton(onPressed: (){
             Navigator.of(context).pushNamed(CategoryDetailScreen.route, arguments: "recommended");
           },
           child: Text("GET RECOMMENDATIONS")) 
          ]
        )
        ),
      )
      
    );
  }
}