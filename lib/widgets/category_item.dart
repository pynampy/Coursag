import 'package:coursag/helpers/size_config.dart';
import '../screens/category_detail_screen.dart';
import 'package:flutter/material.dart';


class CategoryItem extends StatelessWidget {
  final String title;
  final String path;
  CategoryItem(this.title, this.path);


  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(CategoryDetailScreen.route, arguments: title);
            },
              child: Container(
         // width: SizeConfig.screenWidth * 80 / 340,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: const Color(0xff1e487b)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
          
            
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.only(
                 
                  left: SizeConfig.screenWidth * 15/340,
                  top: SizeConfig.screenWidth * 15/340
                  ),
                child: Text(title,
                    style:  TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.screenHeight * 10/747
                        
                        ),
                    textAlign: TextAlign.left),
              ),
              Row(
                 
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Spacer(),
                   Image.asset(path),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
