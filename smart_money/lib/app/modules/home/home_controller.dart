import 'package:fl_chart/fl_chart.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/modules/home/services/home_service_interface.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';
import 'package:smart_money/app/shared/stores/balance_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  // ReactionDisposer  dispose;

  final BalanceStore balanceStore;
  final IHomeService homeService;

  _HomeControllerBase({this.balanceStore, this.homeService}) {
    balanceStore.getBalance();
  }

  @observable
  List<dynamic> entriesModel = [];

  @observable
  List<dynamic> categoriesModel = [];
  
  @action
  Future getTables() async {
    changeCategoriesModel(await homeService.getCategories());
    changeEntriesModel(await homeService.getEntries());
  }

  @action
  changeEntriesModel(List<Entrie> value) => entriesModel = value;

  @action
  changeCategoriesModel(List<Categorie> value) => categoriesModel = value;

  @action
  String getColor(int index) {
    for(var category in categoriesModel) {
      if(entriesModel[index].categoryId == category.id) {
        return category.color;
      }
    }
    return "";
  }

  @observable
  int touchedIndex;

  @action
  changeTouchedIndex(int value) => touchedIndex = value;

  @observable
  PieTouchResponse pieTouchResponse;

  @action
  changePieTouchResponse(PieTouchResponse value) => pieTouchResponse = value;

  isTouched() {
    if (pieTouchResponse.touchInput is FlLongPressEnd || pieTouchResponse.touchInput is FlPanEnd) {
      changeTouchedIndex(-1);
    } else {
      changeTouchedIndex(pieTouchResponse.touchedSectionIndex);
    }
  }

  @observable
  ObservableStream<List<dynamic>> getAll() {
    return homeService.getAllEntriesAsStream().asObservable();
  }

  @observable
  ObservableStream<List<dynamic>> getEntryCategory() {
    return homeService.getEntryWithCategory().asObservable();
  }
}
