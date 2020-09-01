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

  @override
  String toString() {
    return '''
moneyMask: ${moneyMask}
    ''';
  }
}
