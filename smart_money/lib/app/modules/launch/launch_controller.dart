import 'dart:io';

import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/camera_button/stores/camera_image_picker_store.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/edit_button/stores/edit_store.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/gps_button/stores/gps_store.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';
import 'package:smart_money/app/shared/stores/balance_store.dart';

import 'services/database/launch_service_interface.dart';

part 'launch_controller.g.dart';

class LaunchController = _LaunchControllerBase with _$LaunchController;

abstract class _LaunchControllerBase with Store {
  CameraImagePickerStore cameraImagePickerStore;
  ILaunchService launchService;
  BalanceStore balanceStore;
  EditStore editStore;
  GpsStore gpsStore;

  _LaunchControllerBase(
      {this.editStore,
      this.cameraImagePickerStore,
      this.balanceStore,
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
  changeEntry(Entrie genericObject) async {
    await editStore.changeEntry(genericObject);
    await changeMoneyMaskValue(editStore.newEntry.amount);
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
    if (editStore.newEntry.image != null) {
      cameraImagePickerStore.image = File(editStore.newEntry.image);
    }
  }

  @action
  isNewEntryNegative() {
    editStore.newEntry.amount.toString().contains('-') ? false : changeValueType();
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
    categoriesModels = debit
        ? await launchService.getDebit()
        : await launchService.getCredit();
    editStore.categoryDropDownObject = categoriesModels[0];
    valueButtonText = debit ? "DEBITAR" : "CREDITAR";
  }

  isLocalizationActivated() async {
    localizationActivate = await gpsStore.latitude != 0.0 ? true : false;
    gpsStore.latitude = await editStore.newEntry.latitude;
    gpsStore.longitude = await editStore.newEntry.longitude;
  }

  @action
  checkArrayCategory() async {
    if (editStore.newEntry != null) {
      Categorie response = await findCategoryId(editStore.newEntry.category_id);
      var newResponse = categoriesModels.indexOf(response);
      dropDownCategoriesId = newResponse;
      editStore.categoryDropDownObject = response;
      return newResponse;
    }
  }

  @action
  Future<dynamic> findCategoryId(int id) async {
    Categorie categorie;

    categoriesModels = [];
    categoriesModels = await launchService.getListCategories();

    categoriesModels.forEach((element) {
      if (element.id == id) {
        categorie = element;
      }
    });

    return categorie;
  }

  @action
  changeValue(double newValue) => editStore.value = newValue;

  @action
  changeCategories(Categorie newDropDownCategories) async {
    dropDownCategoriesId =
        await categoriesModels.indexOf(newDropDownCategories);
    editStore.categoryDropDownObject = newDropDownCategories;
  }

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
        gpsStore.longitude = 0.0;
        gpsStore.latitude = 0.0;
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
        editStore.value *= -1;
      }

      Entrie object = await editStore.createObjectEntry();
      await launchService.insertData(object);
      balanceStore.getBalance();
    } catch (e) {
      print(e);
    }
  }
}
