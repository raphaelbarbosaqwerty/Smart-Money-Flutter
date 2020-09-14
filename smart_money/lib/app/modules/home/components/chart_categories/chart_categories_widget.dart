import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/components/floating_custom_button/floating_custom_button_widget.dart';
import 'package:smart_money/app/shared/databases/dao/entries_dao.dart';

import '../../../../../app/components/card/card_widget.dart';
import '../../../../../app/modules/home/components/chart_categories/components/indicator.dart';
import '../../../../../app/modules/home/home_controller.dart';

class ChartCategoriesWidget extends StatefulWidget {
  
  final HomeController controller;

  ChartCategoriesWidget({this.controller});

  @override
  _ChartCategoriesWidgetState createState() => _ChartCategoriesWidgetState();
}

class _ChartCategoriesWidgetState extends State<ChartCategoriesWidget> {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CardWidget(
          children: <Widget>[
            ListTile(
              leading: Text('Categorias', style: TextStyle(color: Colors.white)),
            ),
            AspectRatio(
              aspectRatio: 3.0,
              child: Container(
                width: double.maxFinite,
                height: 200,
                child: StreamBuilder<List<dynamic>>(
                  stream: widget.controller.getEntryCategory(),
                  builder: (context, snapshot) {
                    
                    if(!snapshot.hasData) return Container();

                    List<EntryWithCategory> getEntries = snapshot.data.reversed.toList();
                    List<EntryWithCategory> entries = getEntries.length > 4 ? getEntries.getRange(0, 4).toList() : getEntries;

                    return Row(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1.0,
                          child: PieChart(
                            PieChartData(
                                pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                                  if (pieTouchResponse.touchInput is FlLongPressEnd ||
                                      pieTouchResponse.touchInput is FlPanEnd) {
                                    widget.controller.changeTouchedIndex(-1);
                                  } else {
                                    widget.controller.changeTouchedIndex(pieTouchResponse.touchedSectionIndex);
                                  }
                                }),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 5,
                                centerSpaceRadius: 35,
                                sections: List.generate(entries.length, (index) {
                                  final isTouched = index == widget.controller.touchedIndex;
                                  final double fontSize = isTouched ? 15 : 6;
                                  final double radius = isTouched ? 15 : 8;

                                  return PieChartSectionData(
                                    color: Hexcolor('${entries[index].colorCategorie}'),
                                    title: '',
                                    radius: radius,
                                  );
                                }
                              )
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 230,
                              height: 120,
                              child: ListView.builder(
                                itemCount: entries.length,
                                itemBuilder: (_, index) {
                                  return ClipRect(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Indicator(
                                          color: Hexcolor('${entries[index].colorCategorie}'),
                                          text: entries[index].nameCategorie,
                                          isSquare: false,
                                          textColor: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 16,
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 0),
                                            child: Text('R\$ ${entries[index].entrie.amount}', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white)),
                                          ),
                                        ),
                                      ],  
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                )
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
        ),
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: Align(
                alignment: Alignment(0, 1.1),
                heightFactor: 0.5,
                  child: FloatingCustomButtonWidget(
                    heroTag: 'NewEntry',
                    onPressed: () async {
                      Modular.to.pushNamed('/launch');
                    },
                    backgroundColor: Colors.green,
                    child: Icon(Icons.add),
                    elevation: 6,
                  ), 
              ),
            ),
          ],
        ),
      ],
    );
  }
}