import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smart_money/app/components/card/card_widget.dart';
import 'package:smart_money/app/components/container_gradient/container_gradient_widget.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/components/pie_chart/indicator.dart';
import 'package:smart_money/app/components/pie_chart/pie_chart_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Smart Money Flutter"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  int touchedIndex;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Hexcolor('#2c3e50'),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    ContainerGradientWidget(
                      colors: GradientColors.violet,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Container(
                            child: Center(
                              child: Text(
                                'Saldo Atual',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Observer(
                              builder: (_) {
                                return Text('R\$ ${controller.value.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontSize: 32));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                CardWidget(
                  children: <Widget>[
                    ListTile(
                      leading: Text('Categorias', style: TextStyle(color: Colors.white)),
                    ),
                    PieChartWidget(),
                    ListTile(
                      leading: Text('Últimos 7 dias', style: TextStyle(color: Colors.grey)),
                      trailing: FlatButton(
                        child: Text('Ver mais', style: TextStyle(color: Colors.grey)),
                        onPressed: () { print(controller.value);},
                      ),
                    ),
                  ],
                ),
                CardWidget(
                  children: <Widget>[
                    ListTile(
                      leading: Text('Últimos Lançamentos', style: TextStyle(color: Colors.white)),
                    ),
                    Observer(
                      name: 'ListViewLastLaunchs',
                      builder: (_) {
                        return Container(
                          width: double.maxFinite,
                          height: 200,
                          child: ListView.separated(
                            itemCount: controller.entriesModel.length,
                            itemBuilder: (_, index) {
                              return ListTile(
                                title: Indicator(
                                  color: Hexcolor('${controller.getColor(index)}'),
                                  text: controller.entriesModel[index].getDescription ?? "Null",
                                  isSquare: false,
                                  textColor: Colors.white,
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                  child: Text('DateHere', style: TextStyle(color: Colors.grey)),
                                ),
                                trailing: Text('R\$ ${controller.entriesModel[index].getAmount}', style: TextStyle(color: Colors.white)),
                                onTap: () {
                                  // print(controller.entriesModel[index]);
                                  controller.getColor(index);
                                },
                              );
                            },
                            separatorBuilder: (_, __) {
                              return Divider();
                            },
                          )
                        );
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
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
                onPressed: () {
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
