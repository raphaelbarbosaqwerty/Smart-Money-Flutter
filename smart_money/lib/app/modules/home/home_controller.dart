import 'package:fl_chart/fl_chart.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/shared/databases/general_database_interface.dart';
import 'package:smart_money/app/shared/stores/balance_store.dart';


part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  // ReactionDisposer  dispose;

  final IGeneralDatabase generalDatabase;
  final BalanceStore balanceStore;

  _HomeControllerBase(this.generalDatabase, this.balanceStore);

  @observable
  List<dynamic> entriesModel = [];

  @observable
  List<dynamic> categoriesModel = [];
  
  @action
  updateWidget() async {
    await getEntries();
    await getCategoriesColor();
  }

  @action
  Future<List<dynamic>> getEntries() async {
    entriesModel = await generalDatabase.entrieDao.getAllEntries();
    await getCategoriesColor();
    return entriesModel;
  }

  @action
  getCategoriesColor() async {
    categoriesModel = await generalDatabase.categorieDao.getAllCategories();
  }

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
      touchedIndex = -1;
    } else {
      touchedIndex = pieTouchResponse.touchedSectionIndex;
    }
  }

  @observable
  ObservableStream<List<dynamic>> getAll() {
    return generalDatabase.entrieDao.listAll().asObservable();
  }


  // @action
  // Future testing() async {
    
  //   await _generalDatabase.categorieDao.insertCategory(Categorie(
  //     id: null, 
  //     color: '#42f563', 
  //     isCredit: 0, 
  //     isDebit: 1, 
  //     isDefault: 0, 
  //     name: 'Categorie'
  //   ));

  //   await _generalDatabase.entrieDao.addEntry(Entrie(
  //     id: null, 
  //     latitude: 0.0, 
  //     isInit: 0, 
  //     description: "null", 
  //     entryAt: "null", 
  //     image: 'image', 
  //     amount: 0.0, 
  //     address: "Null", 
  //     longitude: 0.0, 
  //     category_id: 1
  //   ));
  // }

  // @action
  // Future newTesting() async {
  //   var response =  await _generalDatabase.entrieDao.getAllEntries();
  //   list.addAll(response);
  // }

  // @observable
  // ObservableList<dynamic> list = [].asObservable();

  // @action
  // Future<List<EntriesModel>> getEntries() async {
  //   var entriesDao = await _databaseService.accessEntriesTable();
  //   entriesModel = await entriesDao.getAllEntries();
  //   print(entriesModel.length);
  //   await getCategoriesColor();
  //   return entriesModel;
  // }

  // @observable
  // ObservableStream<List<Entrie>> getAll() {
  //   return _generalDatabase.returnEntrieDao().listAll().asObservable();
  // }

  // @action
  // Stream<List<Entrie>> testingGetAll() {
  //   return _generalDatabase.returnEntrieDao().listAll();
  // }
}
