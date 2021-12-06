import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/news.dart';

class NewsService {
  static final NewsService _firestoreService = NewsService._internal();
  final String newsCollection = 'news';  
  Firestore database = Firestore.instance;
  NewsService._internal();

  factory NewsService(){
    return _firestoreService;
  }

  //NewsService methods..........................................................
  //POST METHODS
  addNews(News news){
    try{
      database.runTransaction(
        (Transaction transaction) async {
          await database.collection(newsCollection).document().setData(news.toJson());
        }
      );
    } catch(e){
      print(e.toString());
    }
  }

  //GET METHODS
  getNews(){
    return database.collection(newsCollection).snapshots();
  }

  //UPDATE METHODS
  update(News news, News newNews){
    try{
      database.runTransaction(
        (Transaction transaction) async {
          await transaction.update(news.reference, newNews.toMap()); 
        }
      );
    }catch(e){
      print(e.toString());
    }
  } 

  //DELETE METHODS
  delete(News news){
    database.runTransaction(
      (Transaction transaction) async {
        await transaction.delete(news.reference);
      }
    );
  } 
}