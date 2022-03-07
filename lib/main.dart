import 'dart:convert';
import 'dart:io';

import 'package:api_integration/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}


Future<List<Entry>> fetchEntry() async {
  List<Entry> list = [];
  final response = await http.get(
      Uri.parse('https://api.publicapis.org/entries'));

  if (response.statusCode == 200) {
    var bodyData = jsonDecode(response.body);
    bodyData['entries'].forEach((e){
      list.add(Entry.fromJson(e));
    });
      return list;
    // return Entry.fromJson();

  }
  else {
    throw Exception('Failed to load welcome');
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // futureEntry = fetchEntry();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder<List<Entry>>  (
          future: fetchEntry(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemBuilder: (context, index){
                return Card(child: Text(snapshot.data![index].category!));
              });
            } else if ( snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      )

    );
       // This trailing comma makes auto-formatting nicer for build methods.
  }
}
