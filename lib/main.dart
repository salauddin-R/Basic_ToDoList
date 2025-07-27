import 'package:basic_to_do_list/To_Do_List.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       primaryColor: Colors.green
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

