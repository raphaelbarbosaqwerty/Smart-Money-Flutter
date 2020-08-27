import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
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
                child: Observer(
                  builder: (_) {
                    return PieChart(
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
                          sections: List.generate(controller.entriesModel.length, (i) {
                            final isTouched = i == touchedIndex;
                            final double fontSize = isTouched ? 15 : 6;
                            final double radius = isTouched ? 15 : 8;

                            if(controller.entriesModel.length == null || controller.entriesModel.isEmpty){
                              return PieChartSectionData(
                                color: Colors.black,
                                value: 40,
                                title: isTouched ? '40%' : '',
                                radius: radius,
                                titleStyle: TextStyle(
                                    fontSize: fontSize, color: const Color(0xffffffff)),
                              );
                            } else {
                              return PieChartSectionData(
                                color: Hexcolor('${controller.getColor(i)}'),
                                value: 40,
                                title: isTouched ? '40%' : '',
                                radius: radius,
                                titleStyle: TextStyle(
                                    fontSize: fontSize, color: const Color(0xffffffff)),
                              );
                            }
                          }
                        )
                      ),
                    );
                  },
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 230,
                    height: 100,
                    child: Observer(
                      builder: (_) {
                        return ListView.builder(
                          itemCount: controller.entriesModel.length,
                          itemBuilder: (_, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Indicator(
                                  color: Hexcolor('${controller.getColor(index)}'),
                                  text: controller.entriesModel[index].getDescription ?? "Null",
                                  isSquare: false,
                                  textColor: Colors.white,
                                ),
                                SizedBox(
                                  height: 16,
                                  width: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Text('R\$ ${controller.entriesModel[index].getAmount}', style: TextStyle(color: Colors.white)),
                                ),
                              ],  
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ListTile(
          leading: Text('Últimos 7 dias', style: TextStyle(color: Colors.grey)),
          trailing: FlatButton(
            child: Text('Ver mais', style: TextStyle(color: Colors.grey)),
            onPressed: () { 
              controller.updateWidget();
            },
          ),
        ),
      ],
    );
  }
}
