import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/edit_button/stores/edit_store.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/gps_button/stores/gps_store.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

import 'services/database/launch_service_interface.dart';

part 'launch_controller.g.dart';

class LaunchController = _LaunchControllerBase with _$LaunchController;

abstract class _LaunchControllerBase with Store {
  ILaunchService launchService;
  EditStore editStore;
  GpsStore gpsStore;

  _LaunchControllerBase(
      {this.editStore,
      this.launchService,
      this.gpsStore}) {
    populateLaunch();
  }

  @observable
  List<dynamic> categoriesModels;

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

  @observable
  bool localizationActivate = false;

  @observable
  bool loading = false;

  @action
  checkIfExistsEntry(Entrie genericObject) async {
    await editStore.changeEntry(genericObject);
    await changeMoneyMaskValue(editStore.newEntry.amount);
    await isNewEntryNegative();
    await isLocalizationActivated();
    await checkArrayCategory();
  }

  @action
  changeMoneyMaskValue(double value) {
    moneyMask.updateValue(value);
  }

  @action
  isNewEntryNegative() {
    editStore.newEntry.amount.toString().contains('-') ? false : changeValueType();
  }

  @action
  changeValueType() async {
    changeDebit();
    changeDropDownCategoriesId(0);
    debit ? changeValueTypeNegative() : changeValueTypePositive();
    await populateLaunch();
  }

  @action
  changeDebit() {
    debit = !debit;
  }

  @action
  changeValueTypeNegative() {
    valueType = "-";
  }

  @action
  changeValueTypePositive() {
    valueType = "+";
  }

  @action
  changeDropDownCategoriesId(int value) => dropDownCategoriesId = value;

  @action
  populateLaunch() async {
    if(debit) {
      changeCategorieList(await launchService.getDebit());
      changeValueButtonText("DEBITAR");
    } else {
      changeCategorieList(await launchService.getCredit());
      changeValueButtonText("CREDITAR");
    }

    editStore.changeCategoryDropDownObject(categoriesModels[0]); 
    
  }

  @action
  changeValueButtonText(String value) => valueButtonText = value;

  isLocalizationActivated() async {
    if(await gpsStore.getLatitude() != 0.0) {
      changeLocalizationActivate(true);
    } else {
      changeLocalizationActivate(false);
    }
    
    gpsStore.changeLatitude(await editStore.newEntry.latitude);
    gpsStore.changeLongitude(await editStore.newEntry.longitude);
  }

  @action
  changeLocalizationActivate(bool value) => localizationActivate = value;

  @action
  checkArrayCategory() async {
    if (editStore.newEntry != null) {
      Categorie response = await findCategoryId(editStore.newEntry.category_id);
      var newResponse = categoriesModels.indexOf(response);
      changeDropDownCategoriesId(newResponse);
      editStore.changeCategoryDropDownObject(response);
      return newResponse;
    }
  }

  @action
  Future<dynamic> findCategoryId(int id) async {
    Categorie categorie;

    changeCategorieList([]);
    changeCategorieList(await launchService.getListCategories());

    categoriesModels.forEach((element) {
      if (element.id == id) {
        categorie = element;
      }
    });

    return categorie;
  }

  @action
  changeValue(double newValue) => editStore.amount = newValue;

  @action
  changeCategories(Categorie newDropDownCategories) async {
    changeDropDownCategoriesId(await categoriesModels.indexOf(newDropDownCategories));
    editStore.changeCategoryDropDownObject(newDropDownCategories);
  }

  @action
  changeCategorieList(List<Categorie> value) => categoriesModels = value; 

  @action
  changeDescription(String value) => editStore.description = value;

  @action
  Future activateLocalization() async {
    localizationActivate = !localizationActivate;
    loading = true;

    try {
      if (localizationActivate) {
        await gpsStore.getCoordinates();
        await gpsStore.decodeCoordinates();
        loading = false;
      } else {
        gpsStore.changeLatitude(0.0);
        gpsStore.changeLongitude(0.0);
        loading = false;
      }
    } catch (e) {
      print(e);
    }
  }

  @action
  setDebitCredit() async {
    try {
      if (debit) {
        editStore.amount *= -1;
      }

      Entrie object = await editStore.createObjectEntry();
      await launchService.insertData(object);
    } catch (e) {
      print(e);
    }
  }
}
