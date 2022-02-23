import 'package:flutter/material.dart';
import 'package:slinkshot_test/pages/home-page.dart';
import 'package:slinkshot_test/utility/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slinkshot test',
      theme: ThemeData(
        textTheme:  Typography.whiteHelsinki,
        primaryColor: Colors.black,
        backgroundColor: Colors.black,
        canvasColor: Colors.black,
        buttonColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}
