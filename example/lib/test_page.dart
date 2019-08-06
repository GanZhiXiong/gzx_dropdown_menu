import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print('_TestPageState.build');

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 4, top: 0),
        color: Colors.white,
//        child: Container(color: Colors.red,child: Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: TextField(),
//        ),),
        child: ListView(
          children: <Widget>[TextField()],
        ),
      ),
      appBar: AppBar(
        leading: Container(),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState.openEndDrawer();
              })
        ],
      ),
    );
  }
}
