import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/components/form_field/form_field_widget.dart';

import 'welcome_controller.dart';

class WelcomePage extends StatefulWidget {
  final String title;
  const WelcomePage({Key key, this.title = "Welcome"}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends ModularState<WelcomePage, WelcomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Hexcolor('#2c3e50'),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.attach_money_rounded, size: 150, color: Colors.white,),
                  Text(
                    'Olá!',
                    style: TextStyle(color: Colors.white, fontSize: 26),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                    child: Text(
                      'Para começar a usar o Smart Money, você precisa informar o saldo atual. Vamos lá?',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    )
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Informe seu saldo',
                    style: TextStyle(fontSize: 22, color: Colors.white)
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
                          child: FormFieldWidget(
                            controller: controller.moneyMask,
                            labelText: 'Valor',
                            onChanged: (money) {
                              controller.changeValue(controller.moneyMask.numberValue);
                            }
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 50,
                          width: 200,
                          child: OutlineButton(
                            child: Text('Creditar', style: TextStyle(fontSize: 18),),
                            onPressed: () async {
                              await controller.initialBalance();
                              Modular.to.pushReplacementNamed('/home');
                            },
                            textColor: Colors.green,
                            borderSide: BorderSide(color: Colors.green),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ], 
    );
  }
}
