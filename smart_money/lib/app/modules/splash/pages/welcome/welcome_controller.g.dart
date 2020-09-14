// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WelcomeController on _WelcomeControllerBase, Store {
  final _$amountAtom = Atom(name: '_WelcomeControllerBase.amount');

  @override
  double get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(double value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  final _$moneyMaskAtom = Atom(name: '_WelcomeControllerBase.moneyMask');

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

  final _$_WelcomeControllerBaseActionController =
      ActionController(name: '_WelcomeControllerBase');

  @override
  dynamic changeValue(double newValue) {
    final _$actionInfo = _$_WelcomeControllerBaseActionController.startAction(
        name: '_WelcomeControllerBase.changeValue');
    try {
      return super.changeValue(newValue);
    } finally {
      _$_WelcomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initialBalance() {
    final _$actionInfo = _$_WelcomeControllerBaseActionController.startAction(
        name: '_WelcomeControllerBase.initialBalance');
    try {
      return super.initialBalance();
    } finally {
      _$_WelcomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
amount: ${amount},
moneyMask: ${moneyMask}
    ''';
  }
}
