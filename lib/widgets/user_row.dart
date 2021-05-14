import 'package:flutter/material.dart';

class UserRow extends StatelessWidget {
  const UserRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20.0),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter",
                      fontStyle: FontStyle.normal,
                      fontSize: 22.0),
                  text: "Hey Naman\n\n"),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0),
                  text: "Welcome to Coursag")
            ])),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 30,
            ),
          ),
        ]);
  }
}
