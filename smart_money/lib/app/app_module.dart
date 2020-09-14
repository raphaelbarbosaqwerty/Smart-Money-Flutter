import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../app/app_widget.dart';
import '../app/modules/home/home_module.dart';
import 'app_controller.dart';
import 'modules/launch/launch_module.dart';
import 'shared/components/money_balance/money_balance_controller.dart';
import 'shared/stores/balance_store.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),

        // Aditional Controllers
        Bind((i) => MoneyBalanceController(i.get())),

        // Stores
        Bind((i) => BalanceStore(i.get()))

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
