import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';
import 'package:smart_money/app/shared/databases/general_database_interface.dart';
import 'package:smart_money/app/shared/stores/balance_store.dart';
import 'package:geocoder/geocoder.dart';


part 'launch_controller.g.dart';

class LaunchController = _LaunchControllerBase with _$LaunchController;

abstract class _LaunchControllerBase with Store {
  
  IGeneralDatabase _generalDatabase;
  BalanceStore balanceStore;

  _LaunchControllerBase(this._generalDatabase, this.balanceStore) {
    getDebit();
  }
  
  @observable
  double value = 0;

  @observable
  List<dynamic> categoriesModels = [];

  @observable
  String dropDownCategories;

  @observable
  Position position;

  @observable
  bool debit = true;

  @observable
  var moneyMask = MoneyMaskedTextController(leftSymbol: '');

  @observable
  String valueType = '-';

  @observable
  String valueButtonText = "DEBITAR";

  Entrie editEntryModel;

  @action
  editEntry(Entrie entryModel) async { 
    editEntryModel = entryModel;
    editEntryModel != null ?  moneyMask.updateValue(editEntryModel.amount): print(1);
    editEntryModel.amount.toString().contains('-') ?  print('Ué') : changeValueType();
    dropDownCategories = editEntryModel.description;
    latitude = entryModel.latitude;
    longitude = entryModel.longitude;
    localizationActivate = latitude != null ? true : false;
  }

  @action
  changeValue(double newValue) => value = newValue;
  
  @action
  void changeValueType() {
    debit = !debit;
    debit ? valueType = "-" : valueType = "+";
    debit ? getDebit() : getCredit();
  }

  @action
  getDebit() async {
    dropDownCategories = "Alimentação";
    categoriesModels = [];
    categoriesModels = await _generalDatabase.categorieDao.getDebit();
    valueButtonText = "DEBITAR";
  }

  @action
  getCredit() async {
    dropDownCategories = "Empréstimos";
    categoriesModels = [];
    categoriesModels = await _generalDatabase.categorieDao.getCredit();
    valueButtonText = "CREDITAR";
  }

  @action 
  changeCategories(String newDropDownCategories) async {
    dropDownCategories = newDropDownCategories;
  }

  @observable
  double latitude = 0.0;

  @observable
  double longitude = 0.0;

  @observable
  bool localizationActivate = false;

  @action
  Future activateLocalization() async {
    print(longitude);
    try {
      position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      localizationActivate = !localizationActivate;

      latitude = localizationActivate ? position.latitude : 0.0;
      longitude = localizationActivate ? position.longitude : 0.0;

    } catch(e) {
      print(e);
    }
    
  }

  @action
  setDebitCredit() async {
    var response = await _generalDatabase.categorieDao.getAllCategories();
    var categoryId;

    for(var category in response) {
      if(category.name == dropDownCategories) {
        categoryId = category.id;
      }
    }

    if(debit) {
      value *= -1;
    }

    Entrie object = Entrie(
      id: editEntryModel?.id, 
      amount: value, 
      description: editEntryModel?.description == null ? dropDownCategories : editEntryModel.description, 
      entryAt: DateTime.now(), 
      latitude: latitude, 
      longitude: longitude, 
      address: 'null', 
      image: 'null', 
      isInit: 0, 
      category_id: categoryId
    );

    print(latitude);

    if(editEntryModel != null) {
      await _generalDatabase.entrieDao.updateEntry(object);
      balanceStore.getBalance();
    } else {
      await _generalDatabase.entrieDao.addEntry(object); 
      balanceStore.getBalance();
    }
  }

  @action
  Future deleteEntry(int id) async {
    _generalDatabase.entrieDao.removeEntry(id);
  }
}
