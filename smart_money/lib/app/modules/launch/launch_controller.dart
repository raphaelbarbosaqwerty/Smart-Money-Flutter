import 'dart:io';

import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:geocoder/model.dart';
import 'package:image_picker/image_picker.dart';
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

  @observable
  File image;

  @observable
  ImagePicker picker = ImagePicker();

  @observable
  PickedFile pickedFile;

  @observable
  var errorImage;

  @action
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    image = File(pickedFile.path);
  }

  @action
  File getImageSaved(String imagePath) {
    print(imagePath);
    return File(imagePath);
  }

  @action
  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }

    if (response.file != null) {
      pickedFile = response.file;
    } else {
      errorImage = response.exception;
    }
  }

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
    image = entryModel.image != null ? File(entryModel.image) : null;
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

    try {
      print(launchStore.latitude);
      launchStore.latitude = localizationActivate ? await launchInternalComponentsService.getLatitude() : 0.0;
      launchStore.longitude = localizationActivate ? await launchInternalComponentsService.getLongitude() : 0.0;
      await launchStore.decodeCoordinates();
    } catch (e) {
      print(e);
    }
    

  }

  @action
  setDebitCredit() async {
    try {
      if(debit) {
        value *= -1;
      }

      var addressSplitted = launchStore.addresses.first.addressLine.split(',');

      Entrie object = Entrie(
        id: entryModel?.id, 
        amount: value == 0.0 && entryModel.amount != null ? entryModel.amount : value, 
        description: entryModel.description == null || descriptionChanged != null ? descriptionChanged : entryModel.description, 
        entryAt: DateTime.now(), 
        latitude: launchStore.latitude, 
        longitude: launchStore.longitude, 
        address: entryModel.address == null ? '${addressSplitted[0]}' : entryModel.address, 
        image: entryModel.image != null ? entryModel.image : image?.path, 
        isInit: 0, 
        category_id: categoryDropDownObject.id
      );

      await launchService.insertData(object);

      balanceStore.getBalance();
    } catch (e) {
      print(e);
    }
  }
}
