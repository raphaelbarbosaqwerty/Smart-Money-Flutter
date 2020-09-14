import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/camera_button/stores/camera_image_picker_store.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/edit_button/stores/edit_store.dart';
import 'package:smart_money/app/modules/launch/services/internal/gps/launch_internal_components_service.dart';
import 'package:smart_money/app/modules/launch/services/internal/gps/launch_internal_components_service_interface.dart';

import 'components/entry_buttons/components/calender_button/stores/calender_store_widget.dart';
import 'components/entry_buttons/components/gps_button/stores/gps_store.dart';
import 'launch_controller.dart';
import 'launch_page.dart';
import 'services/database/launch_service.dart';
import 'services/database/launch_service_interface.dart';

class LaunchModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Controllers
        Bind(
            (i) => LaunchController(
                launchService: i.get(),
                editStore: i.get(),
                gpsStore: i.get()), lazy: false
            ),
        
        // Stores
        Bind((i) => EditStore(cameraImagePickerStore: i.get(), gpsStore: i.get(), calenderStore: i.get())),
        Bind((i) => GpsStore(launchInternalComponentsService: i.get())),
        Bind((i) => CameraImagePickerStore()),
        Bind((i) => CalenderStore()),

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
