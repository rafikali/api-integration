// import 'package:flutter/material.dart';
//
//
// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     // Getting arguments passed in while calling Navigator.pushNamed
//     final args = settings.arguments;
//     switch (settings.name) {
//       case HomePage.routeName:
//         return MaterialPageRoute(builder: (context) => HomePage());
//       case NextPage.routeName:
//         return MaterialPageRoute(builder: (context) => NextPage());
//
//       default:
//       // If there is no such named route in the switch statement, e.g. /third
//         return MaterialPageRoute(builder: (context) => HomePage());
//     }
//   }
// }