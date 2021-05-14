import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './home_screen.dart';
import '../helpers/size_config.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    SizeConfig().init(context);
    final String assetName1 = 'assets/images/group_60.png';
    final String assetName = 'assets/images/path_59.svg';
    final String assetName2 = 'assets/images/path_42.png';

    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(30, 72, 123, 1),
          Color.fromRGBO(15, 36, 62, 1)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical*10,
                        left: 10,
                        right: 10,
                        bottom: SizeConfig.blockSizeVertical*0.5
                        ),
                    child: Image.asset(
                      assetName1,
                      height: SizeConfig.blockSizeVertical*35,
                      width: SizeConfig.blockSizeHorizontal*70,
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(),
                      child: SvgPicture.asset(
                        assetName,
                        width: SizeConfig.blockSizeHorizontal*30,
                        height: SizeConfig.blockSizeVertical*5,
                        fit: BoxFit.fill,
                      )),
                  Stack(alignment: Alignment.center, children: <Widget>[
                    Image.asset(
                      assetName2,
                      width: SizeConfig.screenWidth,
                      fit: BoxFit.fitWidth,
                    ),
                    Column(children: <Widget>[
                      Text("Confused? \n Which course to study?",
                          style: TextStyle(
                              color: const Color(0xff333e49),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: SizeConfig.blockSizeHorizontal*5
                              ),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical*2,
                      ),
                      Text(
                          "We bring you the best courses from \n around the globe by the best \n platforms!",
                          style:  TextStyle(
                              color: const Color(0xff333e49),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5
                              ),
                          textAlign: TextAlign.center),
                      SizedBox(height: SizeConfig.blockSizeVertical*3),
                      Container(
                        margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical*1 ),
                        width: SizeConfig.blockSizeHorizontal*50,
                        height: SizeConfig.blockSizeVertical*5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            color: const Color(0xff1e487b)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[

                               Padding(
                                 padding: EdgeInsets.only(
                                   right: SizeConfig.blockSizeHorizontal*8,
                                 ),
                                 child: Text("GET STARTED",
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
                                        icon: Icon(Icons.arrow_forward), onPressed: (){
                                          Navigator.of(context).pushReplacementNamed(HomeScreen.route);
                                        }),
                                      ),
                            
                          ],
                        ),
                      )
                    ])
                  ])
                ])));
  }
}