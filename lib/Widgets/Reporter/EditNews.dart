import 'package:flutter/material.dart';
import '../../Model/news.dart';
import '../../Controller/NewsService.dart';
//import 'package:uuid/uuid.dart';
import 'Dashboard.dart';




class EditNews extends StatefulWidget {
  EditNews({Key key, this.news}) : super(key: key);
  final News news;
  @override
  _EditNewsState createState() => _EditNewsState();
}


class _EditNewsState extends State<EditNews> {
  static News _news;
  NewsService newsService = NewsService();
  static TextEditingController descriptionController = TextEditingController();
  static TextEditingController headlineController = TextEditingController();
  static TextEditingController userIdController = TextEditingController();
  static TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();  

  @override
  void initState() {
    _news= widget.news;
    newsDescription.controller.text = _news.description;
    headline.controller.text = _news.headline;
    userId.controller.text = _news.userId;
    date.controller.text = _news.date;
    super.initState();
  }

  static final newsDescription = TextFormField(
    controller: descriptionController,
    decoration: InputDecoration(
      labelText: "Description", hintText: "Enter the description"
    ),
    validator: (value){
      if (value.isEmpty && newsDescription.controller.text == ""){
        return 'Please enter description for news';
      }
      return null;
    },
  );

  static final headline = TextFormField(
    controller: headlineController,
    keyboardType: TextInputType.multiline,
    textInputAction: TextInputAction.newline,
    maxLines: 3,
    decoration: InputDecoration(
      labelText: "Headline", hintText: "Enter the headline"
    ),
    validator: (value){
      if (value.isEmpty && headline.controller.text == ""){
        return 'Please enter headline of news';
      }
      return null;
    },
  );

  static final userId = TextFormField(
    controller: userIdController,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: "userId", hintText: "Enter user ID "
    ),
    validator: (value){
      if (value.isEmpty && userId.controller.text == ""){
        return 'Please enter userId of news';
      }
      return null;
    },
  );

  static final date = TextFormField(
    controller: dateController,
    enabled: false,
    decoration: InputDecoration(
      labelText: "Published on", hintText: "Click button to pick date"
    ),
    validator: (value){
      if (value.isEmpty && date.controller.text == ""){
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
      color: Colors.green[100],
      child: Text("Change Date for News"),
      onPressed: (){
        _selectPublishDate(context);
      },
    );
  }

  final _formKey = GlobalKey<FormState>();

  updateNews(){
    News newNews = News(headline: headline.controller.text, description: newsDescription.controller.text, userId: userId.controller.text, date: date.controller.text);
   
    newsService.update(_news, newNews);
    Navigator.pop(
    context,
    MaterialPageRoute(builder: (context) => Dashboard()),
    );
  }

  saveChangesbutton() {
    TextStyle style = TextStyle(fontFamily: 'Arial', fontSize: 15.0, color: Colors.white);
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        highlightColor: Colors.green[200],
        color: Colors.green[400],
        child: Text("Save Changes", style: style,),
        onPressed: (){
          if (_formKey.currentState.validate()) {
            updateNews();
          }              
        }),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit News'),
        backgroundColor: Colors.purple[300]
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: Padding(              
          padding: const EdgeInsets.all(36.0),
          child: Column(                
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          headline,                          
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
                          SizedBox(
                            height: 10,
                          ),
                          pickDateForNewsButton(context),
                          saveChangesbutton(),
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