// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LaunchController on _LaunchControllerBase, Store {
  final _$valueAtom = Atom(name: '_LaunchControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_LaunchControllerBaseActionController =
      ActionController(name: '_LaunchControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_LaunchControllerBaseActionController.startAction(
        name: '_LaunchControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_LaunchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
