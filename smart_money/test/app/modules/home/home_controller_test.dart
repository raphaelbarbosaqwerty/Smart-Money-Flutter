import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_money/app/modules/home/home_controller.dart';
import 'package:smart_money/app/modules/home/home_module.dart';
import 'package:smart_money/app/modules/home/services/home_service.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';
import 'package:smart_money/app/shared/databases/general_database_interface.dart';
import 'package:smart_money/app/shared/stores/balance_store.dart';

void main() {
  initModule(HomeModule());
  HomeController controller;
  HomeServiceMock homeServiceMock;
  BalanceStoreMock balanceStoreMock;

  setUp(() {
    balanceStoreMock = BalanceStoreMock();
    homeServiceMock = HomeServiceMock();
    controller = HomeController(homeService: homeServiceMock, balanceStore: balanceStoreMock);
  });

  List<Entrie> entriesList = [
    Entrie(id: 1, amount: 1500, category_id: 1, entryAt: DateTime.now(), latitude: 0, longitude: 0),
    Entrie(id: 2, amount: 5500, category_id: 2, entryAt: DateTime.now(), latitude: 0, longitude: 0),
    Entrie(id: 3, amount: 8000, category_id: 3, entryAt: DateTime.now(), latitude: 0, longitude: 0),
  ];

  List<Categorie> categoriesList = [
    Categorie(id: 1, name: 'Salário', color: '#1337'),
    Categorie(id: 2, name: 'Estudos', color: '#1337'),
    Categorie(id: 3, name: 'Restaurantes', color: '#1337'),
  ];

  group('HomeController Test', () {
    test('start entriesModel test', () async {
      expect(controller.entriesModel, []);

      controller.changeEntriesModel(entriesList);
      expect(controller.entriesModel, entriesList);
    });

    test('start categoriesModel test', () {
      expect(controller.categoriesModel, []);
      
      controller.changeCategoriesModel(categoriesList);
      expect(controller.categoriesModel, categoriesList);
    });
  });

  

}

class GeneralDatabaseMock extends Mock implements IGeneralDatabase {}

class HomeControllerMock extends Mock implements HomeController {}

class HomeServiceMock extends Mock implements HomeService {}

class BalanceStoreMock extends Mock implements BalanceStore {}