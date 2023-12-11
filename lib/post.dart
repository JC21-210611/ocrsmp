import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart'; // 追加
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  static String val = "neko";

  void postData(XFile img) async {
    print("パス：" + img.path);
    File file = File(img.path);
    // 画像のバイナリデータを読み込みます.
    ByteData data = await file.readAsBytes().then((bytes) =>
        ByteData.sublistView(Uint8List.fromList(bytes)));
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

    //contentの値を1行にする
    String contentMoji = content.replaceAll('\n', '');

    //、を見つけるまでを1要素として配列に格納する
    List<String> contentList = contentMoji.split('、');

    // contentに改行コードあり、「、」なしで文字列として代入
    content = content.replaceAll("、", "");

    // 成分が含まれているか照合


    print(contentList);

    setState(() {   //この処理を行わないと画面上での動的な変換が行われない
      String values = "";
      for(String s in contentList){
        if(s.contains('糖')){
          values = "$values \n $s";
          debugPrint("追加：　$s");
          debugPrint("表示： $values");
        }
        val = values;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.file(File(path.join(widget.image.path))),
              TextButton(
                  onPressed: () {
                      postData(widget.image);
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