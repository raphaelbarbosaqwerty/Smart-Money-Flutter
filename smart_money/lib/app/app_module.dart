import 'package:smart_money/app/shared/database/services/database_service.dart';

import 'shared/components/money_balance/money_balance_controller.dart';

import 'components/card/card_controller.dart';
import 'components/pie_chart/pie_chart_controller.dart';
import 'components/container_gradient/container_gradient_controller.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:smart_money/app/app_widget.dart';
import 'package:smart_money/app/modules/home/home_module.dart';

import 'modules/launch/launch_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),

        // Aditional Controllers
        Bind((i) => CardController()),
        Bind((i) => PieChartController()),
        Bind((i) => MoneyBalanceController()),
        Bind((i) => ContainerGradientController()),

        // DatabaseServices
        Bind<IDatabaseService>((i) => DatabaseService())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/launch', module: LaunchModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
