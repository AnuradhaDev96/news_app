import 'package:cloud_firestore/cloud_firestore.dart';

class News {                       
  String headline;                       
  String description;
  String userId;
  String date;
  DocumentReference reference;

  News({this.headline, this.description, this.userId, this.date});

  News.fromMap(Map<String, dynamic> map, {this.reference}):
    headline = map["headline"],
    description = map["description"],
    userId = map["userId"],
    date = map["date"];
  
  Map<String, dynamic> toMap(){
    return {
      'headline': headline,
      'description': description,
      'userId' : userId,
      'date' : date
    };
  } 
  
  News.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson(){
    return {
      'headline': headline,
      'description': description,
      'userId' : userId,
      'date' : date
    };
  }
}