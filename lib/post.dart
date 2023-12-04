import 'dart:convert';
import 'package:flutter/services.dart'; // 追加
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

String val = "neko";

class StatePostPage extends StatefulWidget{
  const StatePostPage(this.image, {Key? key}) : super(key: key);
  final XFile image;
  @override
  State<StatePostPage> createState() {
    return PostPage();
  }
}

class PostPage extends State<StatePostPage> {
  //const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(widget.image.path),
              TextButton(
                  onPressed: () {
                    postData(widget.image);
                    /*setState(() {

                    });*/
                  },
                  child: Text('上の画像をAPIに送信します')),
              Text(val,style:TextStyle(fontSize: 15))
            ],
          ),
        ),

      ),
    );
  }
}

void postData(XFile img) async {
  String fileName = 'olehoge.png';
  String filePath = path.join('image', fileName);
  // 画像のバイナリデータを読み込みます.
  ByteData data = await rootBundle.load(filePath); // 修正
  List<int> imageBytes = data.buffer.asUint8List(); // 修正

  var response = await http
      .post(Uri.parse('https://r05-jk3a15cognitive.cognitiveservices.azure.com/computervision/imageanalysis:analyze?language=ja&api-version=2023-02-01-preview&features=read'),
      headers: {
        'Ocp-Apim-Subscription-Key':'2a4e99f274a14a94a4b5f26077b97cf0',
        'Content-Type':'application/octet-stream',
      },
      body: imageBytes
  );
  Map<String, dynamic> jsonDataMap = json.decode(response.body);
  // "content"フィールドの値を取得
  String content = jsonDataMap['readResult']['content'];
  print('Content: $content');

  val = content;

  //print(response.statusCode);
  //print(response.body);
  //contentだけほしい
}