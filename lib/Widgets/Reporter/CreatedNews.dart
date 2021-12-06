import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Model/news.dart';
import '../../Controller/NewsService.dart';
import 'EditNews.dart';



class CreatedNews extends StatefulWidget {
      CreatedNews({Key key}) : super(key: key);
      @override
      _CreatedNewsState createState() => _CreatedNewsState();
}

class _CreatedNewsState extends State<CreatedNews> {
  NewsService newsService = NewsService();  

  @override
  void initState() {
    super.initState();
  }

  getNews(){
    return newsService.getNews();
  }

  deleteNews(News news){
    newsService.delete(news);
  }

  Widget buildBody(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: getNews(),
      builder: (context, snapshot){
        if(snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }
        if(snapshot.hasData){
          //print("Documents ${snapshot.data.documents.length}");
          return buildList(context, snapshot.data.documents);
        }
      },
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot){
    return ListView(
      children: snapshot.map((data) => buildListItem(context, data)).toList(),
    );
  }

  Widget buildListItem(BuildContext context, DocumentSnapshot data){
    final news = News.fromSnapshot(data);
    return Padding (
      key: ValueKey(news.reference.documentID),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: Column(                    
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[            
            Text(              
              news.headline,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.purple[400],
                fontWeight: FontWeight.bold,
              ),              
            ),
            SizedBox(
              height: 2.0,
            ),
            Text(
              news.description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontStyle: FontStyle.italic
              ), 
                            
            ),
            SizedBox(
              height: 2.0,
            ),
            ListTile(
                // title: Text(news.headline),
                subtitle: Text("Published on: " + news.date),
                leading: IconButton(
                  icon: Icon(Icons.edit, color: Colors.green, size: 20,), 
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditNews(news: news,)),
                    );
                  },
                ),                
                trailing: IconButton(
                  icon: Icon(Icons.delete,color: Colors.red, size:20,),
                  onPressed: () {
                    deleteNews(news);
                  },
                  ),
                onTap: (){
                  
                },
                onLongPress: (){
                  //_showDialog(news);
                },
              ),            
          ]
        )
        
        
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        backgroundColor: Colors.purple[300]
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: Padding(              
          padding: const EdgeInsets.all(5.0),
          child: Column(                
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                Flexible(
                      child: buildBody(context)
                    )
            ],
          ),
        ),
      ),
    );
  }
}