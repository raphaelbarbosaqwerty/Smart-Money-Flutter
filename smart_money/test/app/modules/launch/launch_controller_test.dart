import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:smart_money/app/modules/launch/launch_controller.dart';
import 'package:smart_money/app/modules/launch/launch_module.dart';

void main() {
  initModule(LaunchModule());
  LaunchController launch;
  //
  setUp(() {
    launch = Modular.get();
  });

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

  test('testing null', () {
    print(1);
  });
}
