import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/edit_button/stores/edit_store.dart';
import 'package:smart_money/app/modules/launch/components/entry_buttons/components/gps_button/stores/gps_store.dart';
import 'package:smart_money/app/modules/launch/launch_controller.dart';
import 'package:smart_money/app/modules/launch/launch_module.dart';
import 'package:smart_money/app/modules/launch/services/database/launch_service_interface.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

void main() {
  initModule(LaunchModule());
  LaunchController controller;

  LaunchServiceMock launchServiceMock;
  GpsStoreMock gpsStoreMock;
  EditStoreMock editStoreMock;

  //
  setUp(() {

    launchServiceMock = LaunchServiceMock();
    editStoreMock = EditStoreMock();
    gpsStoreMock = GpsStoreMock();

    controller = LaunchController(
      editStore: editStoreMock,
      launchService: launchServiceMock,
      gpsStore: gpsStoreMock
    );
    
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

  group('LaunchController Test', () {
    //   test("First Test", () {
    //     expect(launch, isInstanceOf<LaunchController>());
    //   });

    //   test("Set Value", () {
    //     expect(launch.value, equals(0));
    //     launch.increment();
    //     expect(launch.value, equals(1));
    //   });
  });

  test('changeDebit test', () {
    expect(controller.debit, true);

    controller.changeDebit();
    expect(controller.debit, false);
  });

  test('changeValueTypePositive test', () {
    expect(controller.valueType, '-');

    controller.changeValueTypePositive();
    expect(controller.valueType, '+');
  });

  test('changeValueTypeNegative test', () {
    expect(controller.valueType, '-');

    controller.changeValueTypePositive();
    expect(controller.valueType, '+');

    controller.changeValueTypeNegative();
    expect(controller.valueType, '-');
    
  });

  test('changeDropDownCategoriesId test', () {
    expect(controller.dropDownCategoriesId, 0);
    controller.changeDropDownCategoriesId(1);
    expect(controller.dropDownCategoriesId, 1);
  });
  
  test('changeValueButtonText test', () {
    expect(controller.valueButtonText, 'CREDITAR');

    controller.changeValueButtonText("DEBITAR");
    expect(controller.valueButtonText, 'DEBITAR');
  });
}

class LaunchServiceMock extends Mock implements ILaunchService {}

class EditStoreMock extends Mock implements EditStore {}

class GpsStoreMock extends Mock implements GpsStore {}

class LaunchControllerMock extends Mock implements LaunchController {}