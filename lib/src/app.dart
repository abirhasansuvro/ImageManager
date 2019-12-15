import 'package:flutter/material.dart';
import "dart:convert";
import 'package:http/http.dart' show get;
import 'package:second_app_udemy/src/widgets/image_list.dart';

import 'models/image_model.dart';
import 'widgets/image_list.dart';

class MyApp extends StatefulWidget{
  final int initial_counter;
  MyApp(this.initial_counter);
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp>{
  int counter;
  List<ImageModel> container;
  @override
  void initState() {
    counter=widget.initial_counter;
    container=[];
    super.initState();
  }

  void fetchImage() async{
    var jsonD=await get('https://jsonplaceholder/typicode.com/photos/$counter');
    var imageD=ImageModel.fromJSON(json.decode(jsonD.body));
    setState(() {
      container.add(imageD);
    });
    counter++;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body:Center(
            child: DrawImage(container),
          ),
          appBar: AppBar(
            title: Text('Udemy Tutorial App'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: fetchImage,
            child: Icon(
                Icons.add,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
          ),
        ),
      );
  }
}