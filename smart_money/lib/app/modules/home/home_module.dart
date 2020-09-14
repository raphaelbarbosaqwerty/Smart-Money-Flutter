import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/modules/home/services/home_service.dart';
import 'package:smart_money/app/modules/home/services/home_service_interface.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';
import 'package:smart_money/app/shared/databases/general_database_interface.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(homeService: i.get(), balanceStore: i.get())),
        Bind<IHomeService>((i) => HomeService(generalDatabase: i.get())),
        
        // GeneralDatabase
        Bind<IGeneralDatabase>((i) => GeneralDatabase()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
