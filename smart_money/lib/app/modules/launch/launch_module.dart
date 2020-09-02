import 'components/message/message_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'launch_controller.dart';
import 'launch_page.dart';

class LaunchModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MessageController()),
        Bind((i) => LaunchController(i.get(), i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => LaunchPage(
                  entryObject: args.data,
                )),
      ];

  static Inject get to => Inject<LaunchModule>.of();
}
