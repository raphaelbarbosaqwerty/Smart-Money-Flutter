import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/components/pie_chart/pie_chart_widget.dart';

class CardWidget extends StatelessWidget {
  final children;

  CardWidget({@required this.children});
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.all(2),
        child: Card(
          elevation: 3,
          color: Hexcolor('#34495e'),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: children
          ),
        ),
      ),
    );
  }
}
