import 'package:smart_money/app/shared/database/database_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'database_page.dart';

class DatabaseModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DatabaseController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => DatabasePage()),
      ];

  static Inject get to => Inject<DatabaseModule>.of();
}
