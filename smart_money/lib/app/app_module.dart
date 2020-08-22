import 'package:smart_money/app/shared/components/balance/balance_controller.dart';
import 'package:smart_money/app/shared/database/repositories/database_repository_interface.dart';

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
        Bind((i) => BalanceController()),
        Bind((i) => CardController()),
        Bind((i) => ContainerGradientController()),
        Bind((i) => PieChartController()),

        // DatabaseServices
        Bind<IDatabaseRepository>((i) => DatabaseRepository())
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
