import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/modules/home/components/chart_categories/chart_categories_widget.dart';
import 'package:smart_money/app/modules/home/components/header/header_widget.dart';
import 'package:smart_money/app/modules/home/components/last_launchs/last_launchs_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Smart Money Flutter"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.balanceStore.getBalance();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Hexcolor('#2c3e50'),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HeaderWidget(controller: controller),
                ChartCategoriesWidget(controller: controller),
                LastLaunchsWidget(controller: controller),
              ],
            ),
          ),
        ),
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 120, 5, 0),
              child: FloatingActionButton(
                onPressed: () async {
                  Modular.to.pushNamed('/launch');
                },
                backgroundColor: Colors.green,
                child: Icon(Icons.add),
              )
            ),
          ],
        ),
      ], 
    );
  }
}
