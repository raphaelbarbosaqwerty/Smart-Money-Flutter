import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/components/card/card_widget.dart';
import 'package:smart_money/app/modules/home/components/chart_categories/components/indicator.dart';
import 'package:smart_money/app/modules/home/components/last_launchs/last_launchs_controller.dart';

class LastLaunchsWidget extends StatefulWidget {

  @override
  _LastLaunchsWidgetState createState() => _LastLaunchsWidgetState();
}

class _LastLaunchsWidgetState extends ModularState<LastLaunchsWidget, LastLaunchsController> {

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      children: <Widget>[
        ListTile(
          leading: Text('Últimos Lançamentos', style: TextStyle(color: Colors.white)),
        ),
        Container(
          width: double.maxFinite,
          height: 200,
          child: Observer(
            builder: (_) {
              return ListView.separated(
                itemCount: controller.entriesModel.length,
                itemBuilder: (_, index) {
                  return SizedBox(
                    height: 60,
                    child: ListTile(
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
                    trailing: Padding(
                      padding: EdgeInsets.only(bottom: 18),
                      child: Text('R\$ ${controller.entriesModel[index].getAmount}', style: TextStyle(color: Colors.white)),
                    ),
                    onTap: () {
                      controller.getColor(index);
                    },
                  ),
                  );
                },
                separatorBuilder: (_, __) {
                  return Divider();
                },
              );
            },
          ),
        ),
        SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
