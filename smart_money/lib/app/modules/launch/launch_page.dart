import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/components/card/card_widget.dart';
import 'package:smart_money/app/components/container_gradient/container_gradient_widget.dart';
import 'package:smart_money/app/components/dropdown_button/dropdown_button_widget.dart';
import 'package:smart_money/app/components/form_field/form_field_widget.dart';
import 'package:smart_money/app/modules/launch/components/floating_custom_button/floating_custom_button_widget.dart';
import 'launch_controller.dart';

class LaunchPage extends StatefulWidget {
  final String title;
  const LaunchPage({Key key, this.title = "Launch"}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends ModularState<LaunchPage, LaunchController> {
  //use 'controller' variable to access controller

  List<String> listDatabases = [
    'Lazer',
    'Educação',
    'Teste',
    'Cartão de Crédito'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Hexcolor('#2c3e50'),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Text(
              'Saldo Atual',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardWidget(
                elevation: 0,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 150,
                        height: 45,
                        child: ContainerGradientWidget(
                          colors: GradientColors.violet,
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 5,
                        child: Text('R\$ 0,00', style: TextStyle(color: Colors.white, fontSize: 24)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 28,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: SizedBox(
                  height: 60,
                  child: FlatButton(
                    child: Text('R\$', style: TextStyle(color: Colors.white, fontSize: 24)),
                    onPressed: () {},
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
                  child: Observer(
                    builder: (_) {
                      return FormFieldWidget(
                        controller: TextEditingController(text: '0,05'),
                        labelText: 'Valor',
                        errorText: null,
                        onChanged: null,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 28,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
            child: Observer(
              name: 'DropdownButtonWidgetObserver',
              builder: (_) {
                return InputDecorator(
                  decoration: InputDecoration(
                    fillColor: Hexcolor('#34495e'),
                    filled: true,
                    errorText: null,
                    enabled: false
                  ),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButtonWidget(
                      listDatabases: listDatabases,
                      value: listDatabases[0], //controller?.dropDownDatabase,
                      onChanged: (String newDatabase) {
                        print('Change to: $newDatabase');
                        // controller.changeDatabase(newDatabase); 
                      },
                    ),
                  )
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingCustomButtonWidget(
                  heroTag: 'Calender',
                  onPressed: () {
                    print('Button');
                  },
                  child: Icon(Icons.calendar_today),
                ),
                SizedBox(
                  width: 16,
                ),
                FloatingCustomButtonWidget(
                  heroTag: 'Edit',
                  onPressed: () {
                    print('Button');
                  },
                  child: Icon(Icons.edit),
                ),
                SizedBox(
                  width: 16,
                ),
                FloatingCustomButtonWidget(
                  heroTag: 'Pin',
                  onPressed: () {
                    print('Button');
                  },
                  child: Icon(Icons.pin_drop),
                ),
                SizedBox(
                  width: 16,
                ),
                FloatingCustomButtonWidget(
                  heroTag: 'Camera',
                  onPressed: () {
                    print('Button');
                  },
                  child: Icon(Icons.camera),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlineButton(
                  child: Text("DEBITAR", style: TextStyle(fontSize: 18)),
                  onPressed: () async {
                    await controller.testFunction();
                  },
                  textColor: Colors.green,
                  borderSide: BorderSide(color: Colors.green),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  )
                ),
                FlatButton(
                  child: Text("CANCELAR", style: TextStyle(fontSize: 18)),
                  onPressed: () {
                    print('A');
                  },
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
