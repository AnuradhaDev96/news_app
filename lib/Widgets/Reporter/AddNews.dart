import 'package:flutter/material.dart';
import '../../Model/news.dart';
import '../../Controller/NewsService.dart';


class AddNews extends StatefulWidget {
      AddNews({Key key}) : super(key: key);
      @override
      _AddNewsState createState() => _AddNewsState();
}


class _AddNewsState extends State<AddNews> {
      NewsService newsService = NewsService();

      final newsFormKey = GlobalKey<FormState>();
      static TextEditingController descriptionController = TextEditingController();
      static TextEditingController headlineController = TextEditingController();
      static TextEditingController userIdController = TextEditingController();
      static TextEditingController dateController = TextEditingController();
      DateTime selectedDate = DateTime.now();

      final newsDescription = TextFormField(        
        controller: descriptionController,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        maxLines: 3,
        decoration: InputDecoration(
          labelText: "Description", 
          hintText: "Enter the description"
        ),
        validator: (value){
          if (value.isEmpty){
            return 'Please enter description for News';
          }
          return null;
        },
      );

      final newsHeadline = TextFormField(
        controller: headlineController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Headline", hintText: "Enter the Headline"
        ),
        validator: (value){
          if (value.isEmpty){
            return 'Please enter the headline of news';
          }
          return null;
        },
      );

      final userId = TextFormField(
        controller: userIdController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "UserID", hintText: "Enter user ID"
        ),
        validator: (value){
          if (value.isEmpty){
            return 'Please enter user Id';
          }
          return null;
        },
      );

    final date = TextFormField(
        controller: dateController,
        enabled: false,
        decoration: InputDecoration(
          labelText: "Published on", hintText: "Click button to pick date"
        ),
        validator: (value){
          if (value.isEmpty){
            return 'Please pick a Date';
          }
          return null;
        },
      );

      Future<Null> _selectPublishDate(BuildContext context) async {
        final DateTime picked = await showDatePicker(
            context: context,
            builder: (BuildContext context, Widget child) {
              return Theme(
                data: ThemeData.light(),
                child: child,
              );
            },
            initialDate: selectedDate,
            firstDate: DateTime(2015, 8),
            lastDate: DateTime(2101));
        if (picked != null && picked != selectedDate)
          setState(() {
            selectedDate = picked;
            date.controller.text = selectedDate.toString().substring(0,10);
          });
      }

      pickDateForNewsButton(BuildContext context) {
        return RaisedButton(          
          color: Colors.purple[100],
          child: Text("Pick Date for News"),
          onPressed: (){
            _selectPublishDate(context);
          },
        );
      }
      
      addNews(){
        News news = News(headline: newsHeadline.controller.text, description: newsDescription.controller.text, userId: userId.controller.text, date: date.controller.text);
        newsService.addNews(news);
        newsHeadline.controller.text = "";
        newsDescription.controller.text = "";
        userId.controller.text = "";
        date.controller.text = "";
        selectedDate = DateTime.now();
      }

      postButton() {
        return RaisedButton(
          color: Colors.purple[300],
          child: Text("Post News"),
          onPressed: (){
              if (newsFormKey.currentState.validate()) {
                addNews();
              }              
          },
        );
      }
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Post New News"),
            backgroundColor: Colors.purple[300],
          ),
          body: Container(
            padding: EdgeInsets.all(20.0),
            child: Padding(              
              padding: const EdgeInsets.all(20.0),
              child: Column(                
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Form(
                          key: newsFormKey,
                          child: Column(
                            children: <Widget>[
                              newsHeadline,
                              SizedBox(
                                height: 10,
                              ),
                              newsDescription,
                              SizedBox(
                                height: 10,
                              ),
                              userId,
                              SizedBox(
                                height: 10,
                              ),
                              date,
                              pickDateForNewsButton(context),
                              SizedBox(
                                height: 10,
                              ),
                              postButton(),
                              SizedBox(
                                height: 20
                              ),
                            ],
                          ))
                        ],
                    )
                ],
              ),
            ),
          ),
        );
      }
    }