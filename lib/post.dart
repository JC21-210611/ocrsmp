import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart'; // 追加
import 'package:ocrsample/dbfood.dart';
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

    print(contentMoji);

    String genStr = "";

    if(contentMoji.contains("原材料")){
      //原材料後、内容量までをString型で保持
      RegExp moji = RegExp(r"原材料名(.*?)內容量(.*)");
      RegExp moji2 = RegExp(r"原材料名(.*)");
      RegExpMatch? matchMoji = moji.firstMatch(contentMoji);
      RegExpMatch? matchMoji2 = moji2.firstMatch(contentMoji);

      debugPrint("マッチしたか1:$matchMoji");
      debugPrint("マッチしたか2:$matchMoji2");

      if(matchMoji != null){
        genStr = matchMoji.group(1)!.trim();
        debugPrint("原材料後1：$genStr");
      }else if(matchMoji2 != null){
        genStr = matchMoji2.group(1)!.trim();
        debugPrint("原材料後2：$genStr");
      }
    }else{
      print("else");
      genStr = contentMoji;
    }

    //、を見つけるまでを1要素として配列に格納する
    List<String> contentList = genStr.split('、');

    // contentに改行コードあり、「、」なしで文字列として代入
    content = content.replaceAll("、", "");
    debugPrint("読み込んだ文字：$contentList");

    // 成分が含まれているか照合

    List<Map<String, dynamic>> databaseContent = await dbPage().getData();
    debugPrint("持ってきたDB:$databaseContent");

    setState(() {   //この処理を行わないと画面上での動的な変換が行われない
      String values = "";

      for(Map<String, dynamic> dbc in databaseContent){
        for(String s in contentList) {
          String word = dbc['foodname'];
          if (s.contains(word)) {
            values = "$values \n $s";
            debugPrint("追加：　$s");
            debugPrint("表示： $values");
            break;
          }
        }
      }
      if(values == ""){
        values = "何も検知されませんでした";
      }
      val = values;
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