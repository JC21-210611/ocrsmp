import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'post.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'smp',
      home: StatePostPage(),
    );
  }
}

class page extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Image.asset('image/hoge.png'),
          TextButton(onPressed: (){
              PostPage();
          }, child: Text('neko'))
        ]

      ),
    );
  }
}

