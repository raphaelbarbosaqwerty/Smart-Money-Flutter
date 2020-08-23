// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$valueAtom = Atom(name: '_HomeControllerBase.value');

  @override
  double get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$testFunctionAsyncAction =
      AsyncAction('_HomeControllerBase.testFunction');

  @override
  Future testFunction() {
    return _$testFunctionAsyncAction.run(() => super.testFunction());
  }

  final _$getBalanceAsyncAction = AsyncAction('_HomeControllerBase.getBalance');

  @override
  Future getBalance() {
    return _$getBalanceAsyncAction.run(() => super.getBalance());
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
