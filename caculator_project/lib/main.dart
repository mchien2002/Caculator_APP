import 'package:flutter/material.dart';

import 'CaculatorApp.dart';

void main(List<String> args) {
  runApp(const Caculator());
}

class Caculator extends StatelessWidget {
  const Caculator({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caculator App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CaculatorApp(),
    );
  }
}
