import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  createState() => AppState();
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter += 1;
    final url = 'https://jsonplaceholder.typicode.com/photos/$counter';
    final res = await get(url);
    final imageModel = ImageModel.fromJson(json.decode(res.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: ImageList(images),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Pics'),
      ),
    ));
  }
}
