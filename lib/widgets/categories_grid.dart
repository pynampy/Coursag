import 'package:coursag/helpers/size_config.dart';
import 'package:flutter/material.dart';
import './category_item.dart';


List<String> categories = [
  'Art & Design',
  'Computer \nScience',
  'Personal \nDevelopment',
  'Social Sciences',
  'Math & Logic',
  'Marketing',
  'Data Sciece',
  'Business',
  'Language & \nCommunication',
  'Physical \nScience & \nEngineering',

];

List<String> paths = [

  'assets/images/Griditems/1.png',
  'assets/images/Griditems/2.png',
  'assets/images/Griditems/3.png',
  'assets/images/Griditems/4.png',
  'assets/images/Griditems/5.png',
  'assets/images/Griditems/6.png',
  'assets/images/Griditems/7.png',
  'assets/images/Griditems/8.png',
  'assets/images/Griditems/9.png',
  'assets/images/Griditems/10.png',

];




class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      padding: const EdgeInsets.all(20),
      itemCount: 10,
      itemBuilder: (context,index) => CategoryItem(categories[index],paths[index]),
      

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: SizeConfig.screenWidth * 20/340,
        mainAxisSpacing: SizeConfig.screenHeight * 20/743,
        ),
      
    );
  }
}