import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(AppleApp());
}

class AppleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Cupertino Demo',
      theme: CupertinoThemeData(primaryColor: Colors.deepOrange),
      home: CupertinoHomePage(title: 'Cupertino Demo Home Page'),
    );
  }
}

class CupertinoHomePage extends StatefulWidget {
  CupertinoHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CupertinoHomePageState createState() => _CupertinoHomePageState();
}

class _CupertinoHomePageState extends State<CupertinoHomePage> {

  String _tonightSelected = "";
  List<String> _tonightOption = [
    "鼎泰豐的小籠包佐薑絲米醋",
    "金峰的滷肉飯加蛋",
    "可不可的白玉歐蕾去冰",
    "林東芳的半筋半肉牛肉麵",
    "麥當勞的勁辣雞腿堡配薯條可樂",
    "珍煮丹的黑糖珍珠厚鮮奶半糖少冰",
    "星巴克的特選馥郁那提配起司牛肉可頌",
    "八方雲集的韓式辣味鍋貼配酸辣湯",
    "永和豆漿的爆漿蔥油餅配熱米漿",
    "王品的經典牛小排配奶油菠菜",
    "鼎泰豐的小籠包佐薑絲米醋",
  ];

  void _updateTonightSelected(int index){
    setState(() {
      _tonightSelected = _tonightOption[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino"),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text("今晚 你想來點：\n$_tonightSelected",
                textAlign: TextAlign.center,),
              )
            ),

            Container(
              color: Colors.orange,
              height: 200,
              child: CupertinoPicker(
                onSelectedItemChanged: _updateTonightSelected,
                itemExtent: 40,
                children: List.generate(_tonightOption.length, (index) {
                  return Text(_tonightOption[index]);
                }),
              ),
            )
          ],
        ),
      )
    );
  }
}
