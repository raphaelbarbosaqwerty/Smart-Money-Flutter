import 'dart:io';

import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/modules/launch/services/internal/gps/launch_internal_components_service.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/camera_button/stores/launch_image_picker_store.dart';
import 'package:smart_money/app/modules/launch/stores/launch_store.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';
import 'package:smart_money/app/shared/stores/balance_store.dart';

import 'services/database/launch_service_interface.dart';

part 'launch_controller.g.dart';

class LaunchController = _LaunchControllerBase with _$LaunchController;

abstract class _LaunchControllerBase with Store {
  
  LaunchInternalComponentsService launchInternalComponentsService;
  LaunchImagePickerStore launchImagePickerStore;
  ILaunchService launchService;
  BalanceStore balanceStore;
  LaunchStore launchStore;
  
  _LaunchControllerBase({this.launchImagePickerStore, this.launchStore, this.balanceStore, this.launchService, this.launchInternalComponentsService}) {
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
  changeEntry(Entrie genericObject) async {
    await launchStore.changeEntry(genericObject);
    await changeMoneyMaskValue(launchStore.newEntry.amount);
    await changeImagePreview();
    await isNewEntryNegative();
    await isLocalizationActivated();
    await checkArrayCategory();
  }

  @action
  changeMoneyMaskValue(double value) {
    moneyMask.updateValue(value);
  }

  @action
  changeImagePreview() {
    if(launchStore.newEntry.image != null) {
      launchImagePickerStore.image = File(launchStore.newEntry.image);
    }
  }

  @action
  isNewEntryNegative() {
    if(!launchStore.newEntry.amount.toString().contains('-')) {
      changeValueType();
    }
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
    launchStore.categoryDropDownObject = categoriesModels[0];
    valueButtonText = debit ? "DEBITAR" : "CREDITAR";
  }
  
  isLocalizationActivated() async {
    localizationActivate = await launchStore.latitude != 0.0 ? true : false;
    launchStore.latitude = await launchStore.newEntry.latitude;
    launchStore.longitude = await launchStore.newEntry.longitude;
  }

  @action
  checkArrayCategory() async {
    if(launchStore.newEntry != null) {
      Categorie response = await findCategoryId(launchStore.newEntry.category_id);
      var newResponse = categoriesModels.indexOf(response);
      dropDownCategoriesId = newResponse; 
      launchStore.categoryDropDownObject = response;
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
  changeValue(double newValue) => launchStore.value = newValue;

  @action 
  changeCategories(Categorie newDropDownCategories) async {
    dropDownCategoriesId = await categoriesModels.indexOf(newDropDownCategories);
    launchStore.categoryDropDownObject = newDropDownCategories;
  }

  @action
  changeDescription(String value) => launchStore.description = value;

  @action
  Future activateLocalization() async {
    localizationActivate = !localizationActivate;
    loading = true;
    
    try {
      if(localizationActivate) {
        launchStore.latitude = await launchInternalComponentsService.getLatitude();
        launchStore.longitude = await launchInternalComponentsService.getLongitude();
        await launchStore.decodeCoordinates();
        loading = false;
      } else {
        launchStore.longitude = 0.0;
        launchStore.latitude = 0.0;
        loading = false;
      }
    } catch (e) {
      print(e);
    }
  }

  @action
  setDebitCredit() async {
    try {
      if(debit) {
        launchStore.value *= -1;
      }

      Entrie object = await launchStore.createObjectEntry();
  
      await launchService.insertData(object);

      balanceStore.getBalance();
    } catch (e) {
      print(e);
    }
  }
}
