import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:smart_money/app/shared/database/database_controller.dart';
import 'package:smart_money/app/shared/database/database_module.dart';

void main() {
  initModule(DatabaseModule());
  // DatabaseController database;
  //
  setUp(() {
    //     database = DatabaseModule.to.get<DatabaseController>();
  });

  group('DatabaseController Test', () {
    //   test("First Test", () {
    //     expect(database, isInstanceOf<DatabaseController>());
    //   });

    //   test("Set Value", () {
    //     expect(database.value, equals(0));
    //     database.increment();
    //     expect(database.value, equals(1));
    //   });
  });
}
