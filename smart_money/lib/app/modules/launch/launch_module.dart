import 'package:smart_money/app/shared/database/tables/categories/services/categories_service.dart';
import 'package:smart_money/app/shared/database/tables/categories/services/categories_service_interface.dart';

import 'launch_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'launch_page.dart';

class LaunchModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LaunchController(i.get(), i.get(), i.get())),
        Bind<ICategoriesService>((i) => CategoriesService(i.get()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LaunchPage()),
      ];

  static Inject get to => Inject<LaunchModule>.of();
}
