import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/camera_button/stores/launch_image_picker_store.dart';
import 'package:smart_money/app/modules/launch/services/internal/gps/launch_internal_components_service.dart';
import 'package:smart_money/app/modules/launch/services/internal/gps/launch_internal_components_service_interface.dart';

import 'launch_controller.dart';
import 'launch_page.dart';
import 'services/database/launch_service.dart';
import 'services/database/launch_service_interface.dart';
import 'stores/launch_store.dart';

class LaunchModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Controllers
        Bind(
            (i) => LaunchController(
                launchImagePickerStore: i.get(),
                launchStore: i.get(),
                launchInternalComponentsService: i.get(),
                balanceStore: i.get(),
                launchService: i.get()),
            lazy: false),

        // Stores
        Bind(
            (i) => LaunchStore(
                launchImagePickerStore: i.get(),
                launchInternalComponentsService: i.get()),
            lazy: true),
        Bind((i) => LaunchImagePickerStore()),

        // Services
        Bind<ILaunchService>((i) => LaunchService(generalDatabase: i.get())),
        Bind<ILaunchInternalComponentsService>(
            (i) => LaunchInternalComponentsService()),
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
