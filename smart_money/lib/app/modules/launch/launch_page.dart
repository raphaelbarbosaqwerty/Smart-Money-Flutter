import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/components/card/card_widget.dart';
import 'package:smart_money/app/components/container_gradient/container_gradient_widget.dart';
import 'package:smart_money/app/components/dropdown_button/dropdown_button_widget.dart';
import 'package:smart_money/app/shared/components/money_balance/money_balance_widget.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

import 'components/entry_buttons/entry_buttons_widget.dart';
import 'components/value_button/value_button_widget.dart';
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

  @override
  void initState() {
    if(widget.entryObject != null) {
      controller.checkIfExistsEntry(widget.entryObject);
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
          ValueButtonWidget(controller: controller),
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
                      value: controller.categoriesModels[controller.dropDownCategoriesId],
                      onChanged: (Categorie newDatabase) {
                        controller.changeCategories(newDatabase);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          EntryButtonsWidget(controller: controller, entryObject: controller.editStore.newEntry),
        ],
      )
    );
  }
}
