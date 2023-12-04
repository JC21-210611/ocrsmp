import 'dart:convert';
import 'package:flutter/services.dart'; // 追加
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

String value1 = "nya";
String value2 = "";

class StatePostPage extends StatefulWidget{
  @override
  State<StatePostPage> createState() {
    return PostPage();
  }
}

class PostPage extends State<StatePostPage> {
  //const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _title = TextEditingController();
    TextEditingController _body = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('image/olehoge.png'),
              TextButton(
                  onPressed: () {
                    postData(_title.text, _body.text);
                    setState(() {
                      value2 = value1;
                    });
                  },
                  child: Text('上の画像をAPIに送信します')),
              Text(value2,style:TextStyle(fontSize: 15))
            ],
          ),
        ),

      ),
    );
  }
}

void postData(String _title, String _body) async {
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
        //'Content-Type':'application/json',
      },
      /*body: {
        'binary':'image/MicrosoftTeams-image.png',
      });*/
      body: imageBytes
  );
  Map<String, dynamic> jsonDataMap = json.decode(response.body);
  // "content"フィールドの値を取得
  String content = jsonDataMap['readResult']['content'];
  print('Content: $content');
  value1 = content;

  //print(response.statusCode);
  //print(response.body);
  //contentだけほしい
}