import 'package:coursag/helpers/size_config.dart';
import 'package:coursag/widgets/categories_grid.dart';
import 'package:flutter/material.dart';

import '../widgets/user_row.dart';
import './category_detail_screen.dart';
import 'package:coursag/screens/Question_screen.dart';


class HomeScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  static const route = '/home-screen';

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Coursag', 
              
              style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: SizeConfig.blockSizeHorizontal*5
                              ),


              
              ),
              decoration: BoxDecoration(
               // color: Colors.blue,
                color: Color(0xff1e487b),
              ),
            ),
            ListTile(
              title: Text('Recommend Courses'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
            Navigator.of(context).pushNamed(QuestionScreen.pageName);

              },
            ),
          ],
        ),
        ),
        key: _scaffoldKey,
          body: Stack(
        children: <Widget>[
          Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 141 / 747,
              decoration: BoxDecoration(color: const Color(0xff1e487b))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
              ),
              UserRow(),
              
            ],
          ),

          Container(), // Required some widget in between to float AppBar

          Positioned(
            // To take AppBar Size only
            top: SizeConfig.screenHeight * 141 / 747 - 30,
            left: 20.0,
            right: 20.0,
            child: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.search),
                color: Colors.grey,
                onPressed: (){}
             ),
              primary: false,
              title: TextField(
                textInputAction: TextInputAction.search,
                controller: searchController,
                onSubmitted: (string){
                  Navigator.of(context).pushNamed(CategoryDetailScreen.route, arguments: string);
                },
                  decoration: InputDecoration(

                      hintText: "What do you want to study today?",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey))),
            ),
          ),

          Positioned(
            top: SizeConfig.screenHeight * 141 / 747 + 30,
            child: Container(
              height: SizeConfig.screenHeight - SizeConfig.screenHeight * 141 / 747 - 50,
              width: SizeConfig.screenWidth,
            decoration: BoxDecoration(color: Colors.white),
            child: CategoryGrid(),
          ))
          
        ],
      )),
    );
  }
}
