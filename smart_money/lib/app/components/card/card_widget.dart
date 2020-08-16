import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/components/pie_chart/pie_chart_widget.dart';

class CardWidget extends StatelessWidget {
  final children;
  final double elevation;

  CardWidget({@required this.children, this.elevation = 3});
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.all(2),
        child: Card(
          elevation: elevation,
          color: Hexcolor('#34495e'),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: children
          ),
        ),
      ),
    );
  }
}
