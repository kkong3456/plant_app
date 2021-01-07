

//import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Movie{
  final String title;
  final String keyword;
  final String poster;
  final bool like;
  final DocumentReference reference;

  Movie.fromMap(Map<String,dynamic> map,{this.reference})
  :title=map['title'],
  keyword=map['keyword'],
  poster=map['poster'],
  like=map['like'] {
    print('xxx');
  }

  @override
  String toString()=>'Movie<$title:$keyword>';

  Movie.fromSnapshot1(DocumentSnapshot snapshot)
      :this.fromMap(snapshot.data(),reference:snapshot.reference);

}