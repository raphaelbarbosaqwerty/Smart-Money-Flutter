// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$entriesModelAtom = Atom(name: '_HomeControllerBase.entriesModel');

  @override
  List<EntriesModel> get entriesModel {
    _$entriesModelAtom.reportRead();
    return super.entriesModel;
  }

  @override
  set entriesModel(List<EntriesModel> value) {
    _$entriesModelAtom.reportWrite(value, super.entriesModel, () {
      super.entriesModel = value;
    });
  }

  final _$categoriesModelAtom =
      Atom(name: '_HomeControllerBase.categoriesModel');

  @override
  List<CategoriesModel> get categoriesModel {
    _$categoriesModelAtom.reportRead();
    return super.categoriesModel;
  }

  @override
  set categoriesModel(List<CategoriesModel> value) {
    _$categoriesModelAtom.reportWrite(value, super.categoriesModel, () {
      super.categoriesModel = value;
    });
  }

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

  final _$getEntriesAsyncAction = AsyncAction('_HomeControllerBase.getEntries');

  @override
  Future getEntries() {
    return _$getEntriesAsyncAction.run(() => super.getEntries());
  }

  final _$getCategoriesColorAsyncAction =
      AsyncAction('_HomeControllerBase.getCategoriesColor');

  @override
  Future getCategoriesColor() {
    return _$getCategoriesColorAsyncAction
        .run(() => super.getCategoriesColor());
  }

  final _$getBalanceAsyncAction = AsyncAction('_HomeControllerBase.getBalance');

  @override
  Future getBalance() {
    return _$getBalanceAsyncAction.run(() => super.getBalance());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  String getColor(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getColor');
    try {
      return super.getColor(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
entriesModel: ${entriesModel},
categoriesModel: ${categoriesModel},
value: ${value}
    ''';
  }
}
