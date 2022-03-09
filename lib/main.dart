import 'dart:convert';
import 'package:api_integration/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}


 Future<Data> fetchResults() async {
   final response = await http.get(Uri.parse('https://randomuser.me/api/'));

   if (response.statusCode == 200) {
     var responseData = jsonDecode(response.body);

     return Data.fromJson(responseData);
   } else {
     throw Exception('Error geeting api');
   }
 }
// Future<Models> fetchData() async {
//   final response = await http.get(Uri.parse('https://datausa.io/api/data?drilldowns=Nation&measures=Population'));
//
//   if (response.statusCode == 200) {
//     var responseData = jsonDecode(response.body);
//     print (responseData['data']);
//
//         var bodyData =   Models.fromJson(responseData);
//         print(bodyData);
//         return  bodyData;
//
//
//
//   } else {
//     throw Exception('Erro getttin ghte api');
//   }
//
// }
//
//


// Future<List<Entry>> fetchEntry
//     () async {
//   final response = await http.get(
//       Uri.parse('https://api.publicapis.org/entries'));
//
//   if (response.statusCode == 200) {
//
//     var val = jsonDecode(response.body);
//
//
//
//
//
//
//    return List<Entry>.generate(val['entries'].length, (index) =>
//        Entry.fromJson(val['entries'][index])
//    ).toList();

    // var bodyData = jsonDecode(response.body);
    // bodyData['entries'].forEach((e){
    //   list.add(Entry.fromJson(e));
    // });
    //   return list;
    // return Entry.fromJson();

//   }
//   else {
//     throw Exception('Failed to load welcome');
//   }
// }


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
    print('this is fetch data');
       fetchResults();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder<Data>(
          future: fetchResults(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return ListView.builder(itemBuilder: (itemBuilder));
              return Container(child: Text(snapshot.data!.results![0].name!.title.toString()));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');

            }
            return const CircularProgressIndicator();
            },

        ),
        // child: FutureBuilder<List<Entry>> (
        //   future: fetchEntry(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return ListView.builder(
        //           itemBuilder: (context, index){
        //         return Card(child: Text(
        //           snapshot.data![index].aPI.toString(),
        //         ));
        //       });
        //     } else if ( snapshot.hasError) {
        //       return Text('${snapshot.error}');
        //     }
        //     return const CircularProgressIndicator();
        //   },
        // ),
      )

    );
       // This trailing comma makes auto-formatting nicer for build methods.
  }
}
