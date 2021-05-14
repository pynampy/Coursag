import 'package:flutter/material.dart';
import '../helpers/size_config.dart';

class ReviewRow extends StatelessWidget {
 
  final stars;
  final reviews;

  ReviewRow(this.stars,this.reviews);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 150 / 340,
      padding: EdgeInsets.only(
        top: SizeConfig.screenHeight * 5 / 949,
        bottom: SizeConfig.screenHeight * 0.2 / 949

      ),
      //color: Colors.blue,
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.start,
      //  mainAxisSize: MainAxisSize.max,
        
        children: [
          Icon(
          
            Icons.star,
            color: Color(0xffff6e6b),
          ),
          Text(
            "${stars.toStringAsFixed(1)}/5",
            style: TextStyle(
                color: const Color(0xff333e49),
                fontWeight: FontWeight.w500,
                fontFamily: "Inter",
                fontStyle: FontStyle.normal,
                fontSize:
                    (SizeConfig.screenHeight / 949) * 12),
          ),
          SizedBox(
                      child: Text(
              " ($reviews reviews available)",
              style: TextStyle(
                  color: const Color(0xffb5b5b5),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                  fontStyle: FontStyle.normal,
                  fontSize: (SizeConfig.screenHeight / 949) * 10)),
          ),
          
        ],
      ),
    );
  }
}
