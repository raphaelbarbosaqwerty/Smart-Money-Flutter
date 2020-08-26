import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/modules/home/home_controller.dart';
import 'package:smart_money/app/modules/home/services/home_service.dart';
import 'package:smart_money/app/shared/database/tables/entries/models/entries_model.dart';

part 'header_controller.g.dart';

@Injectable()
class HeaderController = _HeaderControllerBase with _$HeaderController;

abstract class _HeaderControllerBase with Store {

  final HomeController _homeController;
  final HomeService _homeService;

  _HeaderControllerBase(this._homeController, this._homeService) {
    getEntries();
  }

  @observable
  List<EntriesModel> entriesModel = [];

  @action
  Future<double> getValue() async {
    var response = await _homeService.getAmount();
    value = response;
    return value;
  }

  @action
  Future<void> getEntries() async {
    entriesModel = await _homeService.getEntries();
  }

  @observable
  double value = 0.0;

  @action
  void increment() {
    value++;
  }
}
