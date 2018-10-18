import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:hellofultter/pac//pra.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";

void main() {
  var int2 = int.fromEnvironment("1");
  var praClass2 = new praClass();
  var inner = praClass2.inner;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Welcome to Flutter",
      home: new Scaffold(
        appBar: AppBar(
          title: new Text("Welcome to Flutter"),
        ),
        body: RandomWordWidget(),
      ),
    );
  }
}

class RandomWordWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordState();
}

class RandomWordState extends State<RandomWordWidget> {
  List<WordPair> _data = [];
  TextStyle _style = new TextStyle(color: Colors.red, fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return _buildWidget();
  }

  Widget _buildWidget() {
    return new SmartRefresher(
        onRefresh: (up) {

        },
        child: new ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemBuilder: (context, index) {
              if (index.isOdd) {
                return new Divider();
              }
              int i = index ~/ 2;
              if (i >= _data.length) {
                _data.addAll(generateWordPairs().take(10));
              }
              var data = _data[i];
              return _buildRow(data);
            }));
  }

  Widget _buildRow(WordPair data) {
    return ListTile(
      title: new Text(data.asPascalCase, style: _style),
    );
  }
}
