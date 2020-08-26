// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_launchs_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LastLaunchsController on _LastLaunchsControllerBase, Store {
  final _$entriesModelAtom =
      Atom(name: '_LastLaunchsControllerBase.entriesModel');

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
      Atom(name: '_LastLaunchsControllerBase.categoriesModel');

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

  final _$updateWidgetAsyncAction =
      AsyncAction('_LastLaunchsControllerBase.updateWidget');

  @override
  Future updateWidget() {
    return _$updateWidgetAsyncAction.run(() => super.updateWidget());
  }

  final _$testFunctionAsyncAction =
      AsyncAction('_LastLaunchsControllerBase.testFunction');

  @override
  Future testFunction() {
    return _$testFunctionAsyncAction.run(() => super.testFunction());
  }

  final _$getEntriesAsyncAction =
      AsyncAction('_LastLaunchsControllerBase.getEntries');

  @override
  Future<List<EntriesModel>> getEntries() {
    return _$getEntriesAsyncAction.run(() => super.getEntries());
  }

  final _$getCategoriesColorAsyncAction =
      AsyncAction('_LastLaunchsControllerBase.getCategoriesColor');

  @override
  Future getCategoriesColor() {
    return _$getCategoriesColorAsyncAction
        .run(() => super.getCategoriesColor());
  }

  final _$_LastLaunchsControllerBaseActionController =
      ActionController(name: '_LastLaunchsControllerBase');

  @override
  String getColor(int index) {
    final _$actionInfo = _$_LastLaunchsControllerBaseActionController
        .startAction(name: '_LastLaunchsControllerBase.getColor');
    try {
      return super.getColor(index);
    } finally {
      _$_LastLaunchsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
entriesModel: ${entriesModel},
categoriesModel: ${categoriesModel}
    ''';
  }
}
