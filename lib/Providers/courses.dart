import 'package:flutter/cupertino.dart';
import './course.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Courses with ChangeNotifier {
  List<Course> _queryCourses = [];

  List<Course> get queryCourse {
    return [..._queryCourses];
  }

  var try1 = Firestore.instance
      .collection('courses')
      .where('title', arrayContains: 'python');

  Future<List<Course>> fetchCourses(String query) async {
    var coursesSnapshot = await Firestore.instance
        .collection('courses')
        .where(query, isEqualTo: true)
        .getDocuments();


    if (_queryCourses.isNotEmpty) {
      _queryCourses = [];
    }

    if (coursesSnapshot.documents.length != 0) {
      for (int i = 0; i < coursesSnapshot.documents.length; i++) {
        print(coursesSnapshot.documents[i].documentID);
        _queryCourses.add(Course(
          imageUrl: coursesSnapshot.documents[i].data['imageUrl'],
          title: coursesSnapshot.documents[i].data['title'],
          numberOfReviews: coursesSnapshot.documents[i].data['numberOfReviews'],
          reviews: coursesSnapshot.documents[i].data['reviews'],
          price: coursesSnapshot.documents[i].data['price'],
          companyLogo: coursesSnapshot.documents[i].data['imageUrl'],
          duration: coursesSnapshot.documents[i].data['content_info'],
          summary: coursesSnapshot.documents[i].data['objectives_summary'],
          courseUrl: coursesSnapshot.documents[i].data['url']
        ));
      }
    }

    return [..._queryCourses];

    // print(_queryCourses[0].title);
  }

}
