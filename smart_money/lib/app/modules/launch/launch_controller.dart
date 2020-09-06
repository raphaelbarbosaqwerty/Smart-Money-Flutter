import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/modules/launch/services/internal/gps/launch_internal_components_service.dart';
import 'package:smart_money/app/modules/launch/stores/launch_store.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';
import 'package:smart_money/app/shared/stores/balance_store.dart';

import 'services/database/launch_service_interface.dart';

part 'launch_controller.g.dart';

class LaunchController = _LaunchControllerBase with _$LaunchController;

abstract class _LaunchControllerBase with Store {
  
  BalanceStore balanceStore;
  ILaunchService launchService;
  LaunchInternalComponentsService launchInternalComponentsService;
  LaunchStore launchStore;
  
  _LaunchControllerBase({this.launchStore, this.balanceStore, this.launchService, this.launchInternalComponentsService}) {
    populateLaunch();
  }
  
  @observable
  List<dynamic> categoriesModels;

  @observable
  double value = 0.0;

  @observable
  int dropDownCategoriesId = 0;

  @observable
  bool debit = true;

  @observable
  var moneyMask = MoneyMaskedTextController(leftSymbol: '');

  @observable
  String valueType = '-';

  @observable
  String valueButtonText = "DEBITAR";

  Categorie categoryDropDownObject;

  @observable
  dynamic entryModel = Entrie();

  @observable
  String descriptionChanged = '';

  @observable
  bool localizationActivate = false;

  @action
  changeEntryModel(Entrie genericObject) async { 
    entryModel = genericObject;

    await editEntry();
    await isLocalizationActivated();
    
    descriptionChanged = entryModel.description ?? '';

    await checkArrayCategory();
  }

  @action
  editEntry() async {
    await moneyMask.updateValue(entryModel.amount);
    entryModel.amount.toString().contains('-') ?  false : changeValueType();
  }

  @action
  changeValueType() async {
    debit = !debit;
    categoriesModels = [];
    dropDownCategoriesId = 0;
    debit ? valueType = "-" : valueType = "+";
    await populateLaunch();
  }

  @action
  populateLaunch() async {
    categoriesModels = debit ? await launchService.getDebit() : await launchService.getCredit();
    categoryDropDownObject = categoriesModels[0];
    valueButtonText = debit ? "DEBITAR" : "CREDITAR";
  }
  
  isLocalizationActivated() {
    localizationActivate = launchStore.latitude != 0.0 ? true : false;
    launchStore.latitude = entryModel.latitude;
    launchStore.longitude = entryModel.longitude;
  }

  @action
  checkArrayCategory() async {
    if(entryModel != null) {
      Categorie response = await findCategoryId(entryModel.category_id);
      var newResponse = categoriesModels.indexOf(response);
      dropDownCategoriesId = newResponse; 
      categoryDropDownObject = response;
      return newResponse;
    }
  }

  @action
  Future<dynamic> findCategoryId(int id) async {
    Categorie categorie;

    categoriesModels = [];
    categoriesModels = await launchService.getListCategories();

    categoriesModels.forEach((element) {
      if(element.id == id) {
        categorie = element;
      }
    });   

    return categorie;
  }

  @action
  changeValue(double newValue) => value = newValue;

  @action 
  changeCategories(Categorie newDropDownCategories) async {
    dropDownCategoriesId = await categoriesModels.indexOf(newDropDownCategories);
    categoryDropDownObject = newDropDownCategories;
  }

  @action
  changeDescription(String value) => descriptionChanged = value;

  @action
  Future activateLocalization() async {
    localizationActivate = !localizationActivate;

    launchStore.latitude = localizationActivate ? await launchInternalComponentsService.getLatitude() : 0.0;
    launchStore.longitude = localizationActivate ? await launchInternalComponentsService.getLongitude() : 0.0;
  }

  @action
  setDebitCredit() async {
    if(debit) {
      value *= -1;
    }

    Entrie object = Entrie(
      id: entryModel?.id, 
      amount: value == 0.0 && entryModel.amount != null ? entryModel.amount : value, 
      description: entryModel.description == null || descriptionChanged != null ? descriptionChanged : entryModel.description, 
      entryAt: DateTime.now(), 
      latitude: launchStore.latitude, 
      longitude: launchStore.longitude, 
      address: 'null', 
      image: 'null', 
      isInit: 0, 
      category_id: categoryDropDownObject.id
    );

    await launchService.insertData(object);

    balanceStore.getBalance();
  }
}
