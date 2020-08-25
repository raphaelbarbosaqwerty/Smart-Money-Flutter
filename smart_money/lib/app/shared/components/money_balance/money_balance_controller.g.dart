// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_balance_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoneyBalanceController on _MoneyBalanceControllerBase, Store {
  final _$moneyMaskAtom = Atom(name: '_MoneyBalanceControllerBase.moneyMask');

  @override
  MoneyMaskedTextController get moneyMask {
    _$moneyMaskAtom.reportRead();
    return super.moneyMask;
  }

  @override
  set moneyMask(MoneyMaskedTextController value) {
    _$moneyMaskAtom.reportWrite(value, super.moneyMask, () {
      super.moneyMask = value;
    });
  }

  final _$valueAtom = Atom(name: '_MoneyBalanceControllerBase.value');

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

  final _$allEntriesAtom = Atom(name: '_MoneyBalanceControllerBase.allEntries');

  @override
  List<EntriesModel> get allEntries {
    _$allEntriesAtom.reportRead();
    return super.allEntries;
  }

  @override
  set allEntries(List<EntriesModel> value) {
    _$allEntriesAtom.reportWrite(value, super.allEntries, () {
      super.allEntries = value;
    });
  }

  final _$getEntriesAsyncAction =
      AsyncAction('_MoneyBalanceControllerBase.getEntries');

  @override
  Future getEntries() {
    return _$getEntriesAsyncAction.run(() => super.getEntries());
  }

  final _$getBalanceAsyncAction =
      AsyncAction('_MoneyBalanceControllerBase.getBalance');

  @override
  Future getBalance() {
    return _$getBalanceAsyncAction.run(() => super.getBalance());
  }

  final _$_MoneyBalanceControllerBaseActionController =
      ActionController(name: '_MoneyBalanceControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_MoneyBalanceControllerBaseActionController
        .startAction(name: '_MoneyBalanceControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_MoneyBalanceControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
moneyMask: ${moneyMask},
value: ${value},
allEntries: ${allEntries}
    ''';
  }
}
