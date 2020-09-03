import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocoder/geocoder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/components/card/card_widget.dart';
import 'package:smart_money/app/components/container_gradient/container_gradient_widget.dart';
import 'package:smart_money/app/components/dropdown_button/dropdown_button_widget.dart';
import 'package:smart_money/app/components/form_field/form_field_widget.dart';
import 'package:smart_money/app/modules/launch/components/floating_custom_button/floating_custom_button_widget.dart';
import 'package:smart_money/app/modules/launch/components/message/message_widget.dart';
import 'package:smart_money/app/shared/components/money_balance/money_balance_widget.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';
import 'package:asuka/asuka.dart' as asuka;

import 'launch_controller.dart';

class LaunchPage extends StatefulWidget {
  final Entrie entryObject;
  final String title;
  const LaunchPage({Key key, this.title = "Launch", this.entryObject}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends ModularState<LaunchPage, LaunchController> {
  //use 'controller' variable to access controller

  // var moneyMask = MoneyMaskedTextController(leftSymbol: '');

  @override
  void initState() {
    if(widget.entryObject != null) {
      controller.editEntry(widget.entryObject);
    }
    super.initState();
  }
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
                        left: 15,
                        top: 5,
                        child: MoneyBalanceWidget(fontSize: 24, color: Colors.white),
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
                    child: Observer( 
                      name: 'FlatButtonValuType',
                      builder: (_) {
                        return Text('${controller.valueType} R\$', style: TextStyle(color: Colors.white, fontSize: 24));
                      },
                    ),
                    onPressed: () {
                      controller.changeValueType();
                    },
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
                  child: FormFieldWidget(
                    controller: controller.moneyMask,
                    labelText: 'Valor',
                    errorText: null,
                    onChanged: (money) {
                      controller.changeValue(controller.moneyMask.numberValue);
                    }
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
                      listDatabases: controller.categoriesModels,
                      value: controller?.dropDownCategories,
                      onChanged: (String newDatabase) {
                        controller.changeCategories(newDatabase); 

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
                if(widget.entryObject != null)
                  FloatingCustomButtonWidget(
                    heroTag: 'Delete',
                    backgroundColor: Hexcolor('#c0392b'),
                    onPressed: () {
                      asuka.showDialog(
                        builder: (context) => MessageWidget(controller: controller, id: widget.entryObject.id)
                      );
                    },
                    child: Icon(Icons.delete_forever),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                
                FloatingCustomButtonWidget(
                  heroTag: 'Calender',
                  backgroundColor: widget.entryObject?.entryAt != null ? Colors.blueAccent : Hexcolor('#34495e'),
                  onPressed: () {
                    print(controller.value);
                  },
                  child: Icon(Icons.calendar_today),
                ),
                SizedBox(
                  width: 8,
                ),
                FloatingCustomButtonWidget(
                  heroTag: 'Edit',
                  backgroundColor: widget.entryObject?.description != null ? Colors.blueAccent : Hexcolor('#34495e'),
                  onPressed: () {
                    print('Button');
                  },
                  child: Icon(Icons.edit),
                ),
                SizedBox(
                  width: 8,
                ),
                Observer(
                  builder: (_) {
                    return FloatingCustomButtonWidget(
                      heroTag: 'Pin',
                      backgroundColor: controller.latitude != 0.0 ? Colors.blueAccent : Hexcolor('#34495e'),//controller.latitude != 0.0 || (controller.editEntryModel?.latitude ?? 0.0) != 0.0 ? Colors.blueAccent : Hexcolor('#34495e'),
                      onPressed: controller.activateLocalization,
                      child: Icon(Icons.pin_drop),
                    );
                  },
                ),
                SizedBox(
                  width: 8,
                ),
                FloatingCustomButtonWidget(
                  heroTag: 'Camera',
                  backgroundColor: widget.entryObject?.image == '' ? Colors.blueAccent : Hexcolor('#34495e'),
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
                  child: Observer(
                    name: 'ValueButtonText',
                    builder: (_) {
                      return Text("${controller.valueButtonText}", style: TextStyle(fontSize: 18));
                    },
                  ),
                  onPressed: () async {
                    controller.setDebitCredit();
                    Modular.to.pop();
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
                    Modular.to.pop();
                  },
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
