import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

import 'services/splash_service_interface.dart';

part 'splash_controller.g.dart';

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {

  ISplashService splashService;

  _SplashControllerBase({this.splashService});

  @observable
  int value = 0;

  List<Entrie> entries = [];

  @action
  void increment() {
    value++;
  }

  @action
  Future<List<dynamic>> existsEntries() async {
    return await splashService.getEntries();
  }


}
