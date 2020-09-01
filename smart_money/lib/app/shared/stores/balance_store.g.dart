// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BalanceStore on _BalanceStoreBase, Store {
  final _$valueAtom = Atom(name: '_BalanceStoreBase.value');

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

  final _$getBalanceAsyncAction = AsyncAction('_BalanceStoreBase.getBalance');

  @override
  Future<dynamic> getBalance() {
    return _$getBalanceAsyncAction.run(() => super.getBalance());
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
