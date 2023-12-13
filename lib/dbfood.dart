import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Database? _database;
  // データベースを初期化
  static Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'food.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  static Future _onCreate(Database database, int version) async {
    await database.execute('''
      CREATE TABLE food(
        foodid TEXT PRIMARY KEY,
        foodname TEXT,
        categoryid TEXT
      )
    ''');
    //食品の初期データ固定(定義)
    //表示義務
    final values1 = <String, dynamic>{ 'foodid': 'GA1','foodname': 'えび','categoryid': 'HG'};
    final values2 = <String, dynamic>{ 'foodid': 'GA2','foodname': '海老','categoryid': 'HG'};
    final values3 = <String, dynamic>{ 'foodid': 'GA3','foodname': 'shrimp','categoryid': 'HG'};

    final values4 = <String, dynamic>{ 'foodid': 'GB1','foodname': 'くるみ','categoryid': 'HG'};
    final values5 = <String, dynamic>{ 'foodid': 'GB2','foodname': '胡桃','categoryid': 'HG'};
    final values6 = <String, dynamic>{ 'foodid': 'GB3','foodname': 'walnut','categoryid': 'HG'};

    final values7 = <String, dynamic>{ 'foodid': 'GC1','foodname': 'かに','categoryid': 'HG'};
    final values8 = <String, dynamic>{ 'foodid': 'GC2','foodname': '蟹','categoryid': 'HG'};
    final values9 = <String, dynamic>{ 'foodid': 'GC3','foodname': 'crab','categoryid': 'HG'};

    final values10 = <String, dynamic>{ 'foodid': 'GD1','foodname': 'こむぎ','categoryid': 'HG'};
    final values11 = <String, dynamic>{ 'foodid': 'GD2','foodname': '小麦','categoryid': 'HG'};
    final values12 = <String, dynamic>{ 'foodid': 'GD3','foodname': 'wheat','categoryid': 'HG'};

    final values13 = <String, dynamic>{ 'foodid': 'GE1','foodname': 'そば','categoryid': 'HG'};
    final values14 = <String, dynamic>{ 'foodid': 'GE2','foodname': '蕎麦','categoryid': 'HG'};
    final values15 = <String, dynamic>{ 'foodid': 'GE3','foodname': 'buckwheat','categoryid': 'HG'};

    final values16 = <String, dynamic>{ 'foodid': 'GF1','foodname': 'たまご','categoryid': 'HG'};
    final values17 = <String, dynamic>{ 'foodid': 'GF2','foodname': '卵','categoryid': 'HG'};
    final values18 = <String, dynamic>{ 'foodid': 'GF3','foodname': 'egg','categoryid': 'HG'};

    final values19 = <String, dynamic>{ 'foodid': 'GG1','foodname': '乳','categoryid': 'HG'};
    final values20 = <String, dynamic>{ 'foodid': 'GG2','foodname': 'dairy','categoryid': 'HG'};
    final values21 = <String, dynamic>{ 'foodid': 'GG3','foodname': '牛乳','categoryid': 'HG'};
    final values22 = <String, dynamic>{ 'foodid': 'GG4','foodname': 'milk','categoryid': 'HG'};

    final values23 = <String, dynamic>{ 'foodid': 'GH1','foodname': 'ピーナッツ','categoryid': 'HG'};
    final values24 = <String, dynamic>{ 'foodid': 'GH2','foodname': '落花生','categoryid': 'HG'};
    final values25 = <String, dynamic>{ 'foodid': 'GH3','foodname': 'peanut','categoryid': 'HG'};

    //表示推奨
    final values26 = <String, dynamic>{ 'foodid': 'SA1','foodname': 'アーモンド','categoryid': 'HS'};
    final values27 = <String, dynamic>{ 'foodid': 'SA2','foodname': '扁桃','categoryid': 'HS'};
    final values28 = <String, dynamic>{ 'foodid': 'SA3','foodname': 'almond','categoryid': 'HS'};

    final values29 = <String, dynamic>{ 'foodid': 'SB1','foodname': 'あわび','categoryid': 'HS'};
    final values30 = <String, dynamic>{ 'foodid': 'SB2','foodname': '鮑','categoryid': 'HS'};
    final values31 = <String, dynamic>{ 'foodid': 'SB3','foodname': 'abalone','categoryid': 'HS'};

    final values32 = <String, dynamic>{ 'foodid': 'SC1','foodname': 'いか','categoryid': 'HS'};
    final values33 = <String, dynamic>{ 'foodid': 'SC2','foodname': '烏賊','categoryid': 'HS'};
    final values34 = <String, dynamic>{ 'foodid': 'SC3','foodname': 'squid','categoryid': 'HS'};

    final values35 = <String, dynamic>{ 'foodid': 'SD1','foodname': 'いくら','categoryid': 'HS'};
    final values36 = <String, dynamic>{ 'foodid': 'SD2','foodname': '鮭卵','categoryid': 'HS'};
    final values37 = <String, dynamic>{ 'foodid': 'SD3','foodname': 'salmon roe','categoryid': 'HS'};

    final values38 = <String, dynamic>{ 'foodid': 'SE1','foodname': 'カシューナッツ','categoryid': 'HS'};
    final values39 = <String, dynamic>{ 'foodid': 'SE2','foodname': '加州','categoryid': 'HS'};
    final values40 = <String, dynamic>{ 'foodid': 'SE3','foodname': 'cashew nuts','categoryid': 'HS'};

    final values41 = <String, dynamic>{ 'foodid': 'SF1','foodname': 'オレンジ','categoryid': 'HS'};
    final values42 = <String, dynamic>{ 'foodid': 'SF2','foodname': '甘橙','categoryid': 'HS'};
    final values43 = <String, dynamic>{ 'foodid': 'SF3','foodname': 'orange','categoryid': 'HS'};

    final values44 = <String, dynamic>{ 'foodid': 'SG1','foodname': 'キウイ','categoryid': 'HS'};
    final values45 = <String, dynamic>{ 'foodid': 'SG2','foodname': 'キウイフルーツ','categoryid': 'HS'};
    final values46 = <String, dynamic>{ 'foodid': 'SG3','foodname': '彌猴桃','categoryid': 'HS'};
    final values47 = <String, dynamic>{ 'foodid': 'SG4','foodname': 'kiwi','categoryid': 'HS'};

    final values48 = <String, dynamic>{ 'foodid': 'SH1','foodname': 'ぎゅうにく','categoryid': 'HS'};
    final values49 = <String, dynamic>{ 'foodid': 'SH2','foodname': '牛肉','categoryid': 'HS'};
    final values50 = <String, dynamic>{ 'foodid': 'SH3','foodname': 'beef','categoryid': 'HS'};

    final values51 = <String, dynamic>{ 'foodid': 'SI1','foodname': 'ごま','categoryid': 'HS'};
    final values52 = <String, dynamic>{ 'foodid': 'SI2','foodname': '胡麻','categoryid': 'HS'};
    final values53 = <String, dynamic>{ 'foodid': 'SI3','foodname': 'sesame','categoryid': 'HS'};

    final values54 = <String, dynamic>{ 'foodid': 'SJ1','foodname': 'さけ','categoryid': 'HS'};
    final values55 = <String, dynamic>{ 'foodid': 'SJ2','foodname': '鮭','categoryid': 'HS'};
    final values56 = <String, dynamic>{ 'foodid': 'SJ3','foodname': 'salmon','categoryid': 'HS'};

    final values57 = <String, dynamic>{ 'foodid': 'SK1','foodname': 'さば','categoryid': 'HS'};
    final values58 = <String, dynamic>{ 'foodid': 'SK2','foodname': '鯖','categoryid': 'HS'};
    final values59 = <String, dynamic>{ 'foodid': 'SK3','foodname': 'mackerel','categoryid': 'HS'};

    final values60 = <String, dynamic>{ 'foodid': 'SL1','foodname': 'だいず','categoryid': 'HS'};
    final values61 = <String, dynamic>{ 'foodid': 'SL2','foodname': '大豆','categoryid': 'HS'};
    final values62 = <String, dynamic>{ 'foodid': 'SL3','foodname': 'soybean','categoryid': 'HS'};

    final values63 = <String, dynamic>{ 'foodid': 'SM1','foodname': 'とりにく','categoryid': 'HS'};
    final values64 = <String, dynamic>{ 'foodid': 'SM2','foodname': '鶏肉','categoryid': 'HS'};
    final values65 = <String, dynamic>{ 'foodid': 'SM3','foodname': 'chicken','categoryid': 'HS'};

    final values66 = <String, dynamic>{ 'foodid': 'SN1','foodname': 'バナナ','categoryid': 'HS'};
    final values67 = <String, dynamic>{ 'foodid': 'SN2','foodname': '甘蕉','categoryid': 'HS'};
    final values68 = <String, dynamic>{ 'foodid': 'SN3','foodname': 'banana','categoryid': 'HS'};

    final values69 = <String, dynamic>{ 'foodid': 'SO1','foodname': 'ぶたにく','categoryid': 'HS'};
    final values70 = <String, dynamic>{ 'foodid': 'SO2','foodname': '豚肉','categoryid': 'HS'};
    final values71 = <String, dynamic>{ 'foodid': 'SO3','foodname': 'pork','categoryid': 'HS'};

    final values72 = <String, dynamic>{ 'foodid': 'SP1','foodname': 'まつたけ','categoryid': 'HS'};
    final values73 = <String, dynamic>{ 'foodid': 'SP2','foodname': '松茸','categoryid': 'HS'};
    final values74 = <String, dynamic>{ 'foodid': 'SP3','foodname': 'matsutake mushroom','categoryid': 'HS'};

    final values75 = <String, dynamic>{ 'foodid': 'SQ1','foodname': 'もも','categoryid': 'HS'};
    final values76 = <String, dynamic>{ 'foodid': 'SQ2','foodname': '桃','categoryid': 'HS'};
    final values77 = <String, dynamic>{ 'foodid': 'SQ3','foodname': 'peach','categoryid': 'HS'};

    final values78 = <String, dynamic>{ 'foodid': 'SR1','foodname': 'やまいも','categoryid': 'HS'};
    final values79 = <String, dynamic>{ 'foodid': 'SR2','foodname': '山芋','categoryid': 'HS'};
    final values80 = <String, dynamic>{ 'foodid': 'SR3','foodname': 'yam','categoryid': 'HS'};

    final values81 = <String, dynamic>{ 'foodid': 'SS1','foodname': 'りんご','categoryid': 'HS'};
    final values82 = <String, dynamic>{ 'foodid': 'SS2','foodname': '林檎','categoryid': 'HS'};
    final values83 = <String, dynamic>{ 'foodid': 'SS3','foodname': 'apple','categoryid': 'HS'};

    final values84 = <String, dynamic>{ 'foodid': 'ST1','foodname': 'ゼラチン','categoryid': 'HS'};
    final values85 = <String, dynamic>{ 'foodid': 'ST2','foodname': '膠','categoryid': 'HS'};
    final values86 = <String, dynamic>{ 'foodid': 'ST3','foodname': 'gelatin','categoryid': 'HS'};


    //食品の初期データ固定(挿入)
    await database.insert("food", values1);
    await database.insert("food", values2);
    await database.insert("food", values3);
    await database.insert("food", values4);
    await database.insert("food", values5);
    await database.insert("food", values6);
    await database.insert("food", values7);
    await database.insert("food", values8);
    await database.insert("food", values9);
    await database.insert("food", values10);
    await database.insert("food", values11);
    await database.insert("food", values12);
    await database.insert("food", values13);
    await database.insert("food", values14);
    await database.insert("food", values15);
    await database.insert("food", values16);
    await database.insert("food", values17);
    await database.insert("food", values18);
    await database.insert("food", values19);
    await database.insert("food", values20);
    await database.insert("food", values21);
    await database.insert("food", values22);
    await database.insert("food", values23);
    await database.insert("food", values24);
    await database.insert("food", values25);
    await database.insert("food", values26);
    await database.insert("food", values27);
    await database.insert("food", values28);
    await database.insert("food", values29);
    await database.insert("food", values30);
    await database.insert("food", values31);
    await database.insert("food", values32);
    await database.insert("food", values33);
    await database.insert("food", values34);
    await database.insert("food", values35);
    await database.insert("food", values36);
    await database.insert("food", values37);
    await database.insert("food", values38);
    await database.insert("food", values39);
    await database.insert("food", values40);
    await database.insert("food", values41);
    await database.insert("food", values42);
    await database.insert("food", values43);
    await database.insert("food", values44);
    await database.insert("food", values45);
    await database.insert("food", values46);
    await database.insert("food", values47);
    await database.insert("food", values48);
    await database.insert("food", values49);
    await database.insert("food", values50);
    await database.insert("food", values51);
    await database.insert("food", values52);
    await database.insert("food", values53);
    await database.insert("food", values54);
    await database.insert("food", values55);
    await database.insert("food", values56);
    await database.insert("food", values57);
    await database.insert("food", values58);
    await database.insert("food", values59);
    await database.insert("food", values60);
    await database.insert("food", values61);
    await database.insert("food", values62);
    await database.insert("food", values63);
    await database.insert("food", values64);
    await database.insert("food", values65);
    await database.insert("food", values66);
    await database.insert("food", values67);
    await database.insert("food", values68);
    await database.insert("food", values69);
    await database.insert("food", values70);
    await database.insert("food", values71);
    await database.insert("food", values72);
    await database.insert("food", values73);
    await database.insert("food", values74);
    await database.insert("food", values75);
    await database.insert("food", values76);
    await database.insert("food", values77);
    await database.insert("food", values78);
    await database.insert("food", values79);
    await database.insert("food", values80);
    await database.insert("food", values81);
    await database.insert("food", values82);
    await database.insert("food", values83);
    await database.insert("food", values84);
    await database.insert("food", values85);
    await database.insert("food", values86);
  }
  // データベースを取得
  static Future<Database> get database async {
    return _database ??= await _initDB();
  }
  // データベースの中身を取得
  static Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await database;

    return await db.query('food');
  }
}
class dbpage extends StatefulWidget {
  @override
  dbPage createState() => dbPage();
}
class dbPage extends State<dbpage> {
  List<Map<String, dynamic>> databaseContent = []; // データベースの中身を格納するリスト
  // 画面が作成されるときに呼ばれるメソッド
  @override
  void initState() {
    super.initState();
    fetchDataFromDatabase(); // データベースの中身を取得
  }
  // データベースの中身を取得する処理
  Future<void> fetchDataFromDatabase() async {
    databaseContent = await DbHelper.getAllData();
    //setState(() {}); // データが取得されたことを反映
    debugPrint("DBくん:$databaseContent");
  }

  Future<List<Map<String, dynamic>>> getData() async{
    databaseContent = await DbHelper.getAllData();
    return databaseContent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              DbHelper._initDB();
              fetchDataFromDatabase(); // データベースの中身を再取得
              setState(() {}); // ステートを更新して再構築
            },
            child: Text('データベースの中身を取得'),
          ),
          // データベースの中身を表示
          Expanded(
            child: ListView.builder(
              itemCount: databaseContent.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(databaseContent[index]['foodname']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  /*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  DbHelper._initDB();
                  fetchDataFromDatabase(); // データベースの中身を再取得
                },
                child: Text('データベースの中身を取得'),
              ),
              // データベースの中身を表示
              Container(
                margin: EdgeInsets.all(10),
                //listview以外で表示する方法を探す
                child:ListView.builder(
                  shrinkWrap: true,
                  itemCount: databaseContent.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(databaseContent[index]['foodname']),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }*/
}