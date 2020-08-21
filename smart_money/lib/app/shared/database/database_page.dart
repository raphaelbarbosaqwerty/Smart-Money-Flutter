import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'database_controller.dart';

class DatabasePage extends StatefulWidget {
  final String title;
  const DatabasePage({Key key, this.title = "Database"}) : super(key: key);

  @override
  _DatabasePageState createState() => _DatabasePageState();
}

class _DatabasePageState
    extends ModularState<DatabasePage, DatabaseController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
