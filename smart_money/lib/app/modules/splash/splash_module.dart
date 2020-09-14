import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/modules/splash/pages/welcome/welcome_page.dart';
import 'package:smart_money/app/modules/splash/services/splash_service.dart';

import 'pages/welcome/welcome_controller.dart';
import 'services/splash_service_interface.dart';
import 'splash_controller.dart';
import 'splash_page.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController(splashService: i.get())),
        Bind((i) => WelcomeController(splashService: i.get())),

        // Services
        Bind<ISplashService>((i) => SplashService(generalDatabase: i.get()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashPage()),
        ModularRouter('/welcome', child: (_, args) => WelcomePage()),
      ];

  static Inject get to => Inject<SplashModule>.of();
}
