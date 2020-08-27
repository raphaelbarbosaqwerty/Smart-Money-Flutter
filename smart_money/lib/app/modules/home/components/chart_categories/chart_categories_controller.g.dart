// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_categories_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChartCategoriesController on _ChartCategoriesControllerBase, Store {
  final _$entriesModelAtom =
      Atom(name: '_ChartCategoriesControllerBase.entriesModel');

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
      Atom(name: '_ChartCategoriesControllerBase.categoriesModel');

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

  final _$valueAtom = Atom(name: '_ChartCategoriesControllerBase.value');

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

  final _$updateWidgetAsyncAction =
      AsyncAction('_ChartCategoriesControllerBase.updateWidget');

  @override
  Future updateWidget() {
    return _$updateWidgetAsyncAction.run(() => super.updateWidget());
  }

  final _$getEntriesAsyncAction =
      AsyncAction('_ChartCategoriesControllerBase.getEntries');

  @override
  Future<List<EntriesModel>> getEntries() {
    return _$getEntriesAsyncAction.run(() => super.getEntries());
  }

  final _$getCategoriesColorAsyncAction =
      AsyncAction('_ChartCategoriesControllerBase.getCategoriesColor');

  @override
  Future getCategoriesColor() {
    return _$getCategoriesColorAsyncAction
        .run(() => super.getCategoriesColor());
  }

  final _$_ChartCategoriesControllerBaseActionController =
      ActionController(name: '_ChartCategoriesControllerBase');

  @override
  String getColor(int index) {
    final _$actionInfo = _$_ChartCategoriesControllerBaseActionController
        .startAction(name: '_ChartCategoriesControllerBase.getColor');
    try {
      return super.getColor(index);
    } finally {
      _$_ChartCategoriesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$_ChartCategoriesControllerBaseActionController
        .startAction(name: '_ChartCategoriesControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ChartCategoriesControllerBaseActionController.endAction(_$actionInfo);
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
