// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LaunchController on _LaunchControllerBase, Store {
  final _$valueAtom = Atom(name: '_LaunchControllerBase.value');

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

  final _$categoriesModelsAtom =
      Atom(name: '_LaunchControllerBase.categoriesModels');

  @override
  List<dynamic> get categoriesModels {
    _$categoriesModelsAtom.reportRead();
    return super.categoriesModels;
  }

  @override
  set categoriesModels(List<dynamic> value) {
    _$categoriesModelsAtom.reportWrite(value, super.categoriesModels, () {
      super.categoriesModels = value;
    });
  }

  final _$dropDownCategoriesAtom =
      Atom(name: '_LaunchControllerBase.dropDownCategories');

  @override
  String get dropDownCategories {
    _$dropDownCategoriesAtom.reportRead();
    return super.dropDownCategories;
  }

  @override
  set dropDownCategories(String value) {
    _$dropDownCategoriesAtom.reportWrite(value, super.dropDownCategories, () {
      super.dropDownCategories = value;
    });
  }

  final _$debitAtom = Atom(name: '_LaunchControllerBase.debit');

  @override
  bool get debit {
    _$debitAtom.reportRead();
    return super.debit;
  }

  @override
  set debit(bool value) {
    _$debitAtom.reportWrite(value, super.debit, () {
      super.debit = value;
    });
  }

  final _$valueTypeAtom = Atom(name: '_LaunchControllerBase.valueType');

  @override
  String get valueType {
    _$valueTypeAtom.reportRead();
    return super.valueType;
  }

  @override
  set valueType(String value) {
    _$valueTypeAtom.reportWrite(value, super.valueType, () {
      super.valueType = value;
    });
  }

  final _$getDebitAsyncAction = AsyncAction('_LaunchControllerBase.getDebit');

  @override
  Future getDebit() {
    return _$getDebitAsyncAction.run(() => super.getDebit());
  }

  final _$getCreditAsyncAction = AsyncAction('_LaunchControllerBase.getCredit');

  @override
  Future getCredit() {
    return _$getCreditAsyncAction.run(() => super.getCredit());
  }

  final _$changeCategoriesAsyncAction =
      AsyncAction('_LaunchControllerBase.changeCategories');

  @override
  Future changeCategories(String newDropDownCategories) {
    return _$changeCategoriesAsyncAction
        .run(() => super.changeCategories(newDropDownCategories));
  }

  final _$setDebitCreditAsyncAction =
      AsyncAction('_LaunchControllerBase.setDebitCredit');

  @override
  Future setDebitCredit() {
    return _$setDebitCreditAsyncAction.run(() => super.setDebitCredit());
  }

  final _$_LaunchControllerBaseActionController =
      ActionController(name: '_LaunchControllerBase');

  @override
  void changeValueType() {
    final _$actionInfo = _$_LaunchControllerBaseActionController.startAction(
        name: '_LaunchControllerBase.changeValueType');
    try {
      return super.changeValueType();
    } finally {
      _$_LaunchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeValue(double newValue) {
    final _$actionInfo = _$_LaunchControllerBaseActionController.startAction(
        name: '_LaunchControllerBase.changeValue');
    try {
      return super.changeValue(newValue);
    } finally {
      _$_LaunchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
categoriesModels: ${categoriesModels},
dropDownCategories: ${dropDownCategories},
debit: ${debit},
valueType: ${valueType}
    ''';
  }
}
