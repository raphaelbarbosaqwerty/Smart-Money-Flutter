import 'package:smart_money/app/modules/home/services/home_service.dart';

import 'components/chart_categories/chart_categories_controller.dart';
import 'components/header/header_controller.dart';
import 'components/last_launchs/last_launchs_controller.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => HeaderController(i.get(), i.get())),
        Bind((i) => ChartCategoriesController()),
        Bind((i) => LastLaunchsController(i.get(), i.get())),

        Bind((i) => HomeService(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
