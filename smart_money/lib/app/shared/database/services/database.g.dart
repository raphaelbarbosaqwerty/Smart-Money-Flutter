// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorFlutterDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder databaseBuilder(String name) =>
      _$FlutterDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FlutterDatabaseBuilder(null);
}

class _$FlutterDatabaseBuilder {
  _$FlutterDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$FlutterDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FlutterDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FlutterDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$FlutterDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FlutterDatabase extends FlutterDatabase {
  _$FlutterDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CategoriesDao _categoriesDaoInstance;

  EntriesDao _entriesDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `categories` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `color` TEXT, `isDefault` INTEGER, `isCredit` INTEGER, `isDebit` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `entries` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `amount` REAL, `description` TEXT, `entryAt` TEXT, `latitude` REAL, `longitude` REAL, `address` TEXT, `image` TEXT, `isInit` INTEGER, `category_id` INTEGER, FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CategoriesDao get categoriesDao {
    return _categoriesDaoInstance ??= _$CategoriesDao(database, changeListener);
  }

  @override
  EntriesDao get entriesDao {
    return _entriesDaoInstance ??= _$EntriesDao(database, changeListener);
  }
}

class _$CategoriesDao extends CategoriesDao {
  _$CategoriesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _categoriesModelInsertionAdapter = InsertionAdapter(
            database,
            'categories',
            (CategoriesModel item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'color': item.color,
                  'isDefault': item.isDefault,
                  'isCredit': item.isCredit,
                  'isDebit': item.isDebit
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _categoriesMapper = (Map<String, dynamic> row) =>
      CategoriesModel(
          id: row['id'] as int,
          name: row['name'] as String,
          color: row['color'] as String,
          isDefault: row['isDefault'] as int,
          isCredit: row['isCredit'] as int,
          isDebit: row['isDebit'] as int);

  final InsertionAdapter<CategoriesModel> _categoriesModelInsertionAdapter;

  @override
  Future<List<CategoriesModel>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM categories ORDER BY name',
        mapper: _categoriesMapper);
  }

  @override
  Future<List<CategoriesModel>> getDebit() async {
    return _queryAdapter.queryList(
        'SELECT * FROM categories WHERE isDebit = 1 ORDER BY name',
        mapper: _categoriesMapper);
  }

  @override
  Future<List<CategoriesModel>> getCredit() async {
    return _queryAdapter.queryList(
        'SELECT * FROM categories WHERE isCredit = 1 ORDER BY name',
        mapper: _categoriesMapper);
  }

  @override
  Future<void> insertCategory(CategoriesModel categoryModel) async {
    await _categoriesModelInsertionAdapter.insert(
        categoryModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertCategoryList(List<CategoriesModel> categoryModel) async {
    await _categoriesModelInsertionAdapter.insertList(
        categoryModel, OnConflictStrategy.abort);
  }
}

class _$EntriesDao extends EntriesDao {
  _$EntriesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _entriesModelInsertionAdapter = InsertionAdapter(
            database,
            'entries',
            (EntriesModel item) => <String, dynamic>{
                  'id': item.id,
                  'amount': item.amount,
                  'description': item.description,
                  'entryAt': item.entryAt,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'address': item.address,
                  'image': item.image,
                  'isInit': item.isInit,
                  'category_id': item.categoryId
                }),
        _entriesModelUpdateAdapter = UpdateAdapter(
            database,
            'entries',
            ['id'],
            (EntriesModel item) => <String, dynamic>{
                  'id': item.id,
                  'amount': item.amount,
                  'description': item.description,
                  'entryAt': item.entryAt,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'address': item.address,
                  'image': item.image,
                  'isInit': item.isInit,
                  'category_id': item.categoryId
                }),
        _entriesModelDeletionAdapter = DeletionAdapter(
            database,
            'entries',
            ['id'],
            (EntriesModel item) => <String, dynamic>{
                  'id': item.id,
                  'amount': item.amount,
                  'description': item.description,
                  'entryAt': item.entryAt,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'address': item.address,
                  'image': item.image,
                  'isInit': item.isInit,
                  'category_id': item.categoryId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _entriesMapper = (Map<String, dynamic> row) => EntriesModel(
      id: row['id'] as int,
      amount: row['amount'] as double,
      description: row['description'] as String,
      entryAt: row['entryAt'] as String,
      latitude: row['latitude'] as double,
      longitude: row['longitude'] as double,
      address: row['address'] as String,
      image: row['image'] as String,
      isInit: row['isInit'] as int,
      categoryId: row['category_id'] as int);

  final InsertionAdapter<EntriesModel> _entriesModelInsertionAdapter;

  final UpdateAdapter<EntriesModel> _entriesModelUpdateAdapter;

  final DeletionAdapter<EntriesModel> _entriesModelDeletionAdapter;

  @override
  Future<List<EntriesModel>> getAllEntries() async {
    return _queryAdapter.queryList('SELECT * FROM entries',
        mapper: _entriesMapper);
  }

  @override
  Future<EntriesModel> getEntry(int id) async {
    return _queryAdapter.query('SELECT * FROM entries WHERE id = ?',
        arguments: <dynamic>[id], mapper: _entriesMapper);
  }

  @override
  Future<void> deleteAllEntries() async {
    await _queryAdapter.queryNoReturn('DELETE FROM entries');
  }

  @override
  Future<int> insertEntry(EntriesModel entry) {
    return _entriesModelInsertionAdapter.insertAndReturnId(
        entry, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateEntry(EntriesModel entry) {
    return _entriesModelUpdateAdapter.updateAndReturnChangedRows(
        entry, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteEntry(EntriesModel entry) {
    return _entriesModelDeletionAdapter.deleteAndReturnChangedRows(entry);
  }
}
