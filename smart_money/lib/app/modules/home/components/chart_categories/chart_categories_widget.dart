import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/components/card/card_widget.dart';
import 'package:smart_money/app/modules/home/components/chart_categories/components/indicator.dart';
import 'package:smart_money/app/modules/home/components/chart_categories/chart_categories_controller.dart';

class ChartCategoriesWidget extends StatefulWidget {
  @override
  _ChartCategoriesWidgetState createState() => _ChartCategoriesWidgetState();
}

class _ChartCategoriesWidgetState extends ModularState<ChartCategoriesWidget, ChartCategoriesController> {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      children: <Widget>[
        ListTile(
          leading: Text('Categorias', style: TextStyle(color: Colors.white)),
        ),
        AspectRatio(
          aspectRatio: 3.0,
          child: Row(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.0,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                        setState(() {
                          if (pieTouchResponse.touchInput is FlLongPressEnd ||
                              pieTouchResponse.touchInput is FlPanEnd) {
                            touchedIndex = -1;
                          } else {
                            touchedIndex = pieTouchResponse.touchedSectionIndex;
                          }
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 5,
                      centerSpaceRadius: 35,
                      sections: showingSections()),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Indicator(
                        color: Color(0xff0293ee),
                        text: 'Educação',
                        isSquare: false,
                        textColor: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text('R\$ 1800,00', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: Color(0xfff8b250),
                    text: 'Second',
                    isSquare: false,
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: Color(0xff845bef),
                    text: 'Third',
                    isSquare: false,
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: Color(0xff13d38e),
                    text: 'Fourth',
                    isSquare: false,
                    textColor: Colors.white,
                  ),
                ],
              ),
              Text(''),
            ],
          ),
        ),
        ListTile(
          leading: Text('Últimos 7 dias', style: TextStyle(color: Colors.grey)),
          trailing: FlatButton(
            child: Text('Ver mais', style: TextStyle(color: Colors.grey)),
            onPressed: () { 
            },
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 15 : 6;
      final double radius = isTouched ? 15 : 8;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: isTouched ? '40%' : '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: isTouched ? '30%' : '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: isTouched ? '15%' : '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: isTouched ? '15%' : '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}
