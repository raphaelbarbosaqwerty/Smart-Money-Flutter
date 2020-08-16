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
                ContainerGradientWidget(
                  colors: GradientColors.violet,
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
                        onPressed: () { print('Ver mais'); },
                      ),
                    ),
                  ],
                ),
                CardWidget(
                  children: <Widget>[
                    ListTile(
                      leading: Text('Últimos Lançamentos', style: TextStyle(color: Colors.white)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Indicator(
                            color: Color(0xff0293ee),
                            text: 'Educação',
                            isSquare: false,
                            textColor: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Text('R\$ 1800,00', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Indicator(
                            color: Color(0xff0293ee),
                            text: 'Educação',
                            isSquare: false,
                            textColor: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Text('R\$ 1800,00', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Indicator(
                            color: Color(0xff0293ee),
                            text: 'Educação',
                            isSquare: false,
                            textColor: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Text('R\$ 1800,00', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   child: Steps(
                    //     direction: Axis.vertical,
                    //     size: 7,
                    //     path: {'color': Colors.white, 'width': 2.0},
                    //     steps: [
                    //       {
                    //         'color': Colors.white,
                    //         'background': Colors.red,
                    //         'label': '',
                    //       },
                    //       {
                    //         'color': Colors.white,
                    //         'background': Colors.lightBlue.shade200,
                    //         'label': '1',
                    //         'content': Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: <Widget>[
                    //             Text(
                    //               'Laborum exercitation',
                    //               style: TextStyle(fontSize: 22.0),
                    //             ),
                    //             Text(
                    //               'Qui et consectetur esse duis excepteur magna consectetur.',
                    //               style: TextStyle(fontSize: 12.0),
                    //             ),
                    //           ],
                    //         ),
                    //       },
                    //     ],
                    //   ),
                    // ),
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

class Steps extends StatelessWidget {
  final Axis direction;
  final List steps;
  final double size;
  final Map path;
  Steps({
    Key key,
    this.direction = Axis.vertical,
    @required this.steps,
    this.size = 21,
    @required this.path,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: ListView.builder(
        scrollDirection: direction,
        itemCount: steps.length,
        itemBuilder: (context, position) => Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              bottom: 0,
              left: 16 + size * 2.14 / 2 - 5 / 2,
              height: direction == Axis.horizontal ? path['width'] : null,
              width: direction == Axis.horizontal ? null : path['width'],
              child: Container(
                color: path['color'],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Indicator(
                    color: Color(0xff0293ee),
                    text: 'Educação',
                    isSquare: false,
                    textColor: Colors.white,
                  ),
                  steps[position]['content'] != null
                      ? direction == Axis.horizontal
                          ? Padding(
                              padding: EdgeInsets.only(top: size * 2.14),
                              child: steps[position]['content'],
                            )
                          : Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: size * 2.14),
                                child: steps[position]['content'],
                              ),
                            )
                      : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
