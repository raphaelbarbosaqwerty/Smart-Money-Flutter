import 'package:flutter/material.dart';

class BalanceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            child: Text(
              'R\$ 0,00',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
        ),
      ],
    );
  }
}
