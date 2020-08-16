import 'launch_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'launch_page.dart';

class LaunchModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LaunchController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LaunchPage()),
      ];

  static Inject get to => Inject<LaunchModule>.of();
}
