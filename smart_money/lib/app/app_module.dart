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
        Bind((i) => CardController()),
        Bind((i) => ContainerGradientController()),
        Bind((i) => PieChartController()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/launch', module: LaunchModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
