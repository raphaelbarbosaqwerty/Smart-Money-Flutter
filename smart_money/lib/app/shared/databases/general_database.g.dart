// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Entrie extends DataClass implements Insertable<Entrie> {
  final int id;
  final double amount;
  final String description;
  final DateTime entryAt;
  final double latitude;
  final double longitude;
  final String address;
  final String image;
  final int isInit;
  final int category_id;
  Entrie(
      {@required this.id,
      @required this.amount,
      @required this.description,
      @required this.entryAt,
      @required this.latitude,
      @required this.longitude,
      @required this.address,
      @required this.image,
      @required this.isInit,
      @required this.category_id});
  factory Entrie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Entrie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      amount:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      entryAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}entry_at']),
      latitude: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      isInit:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}is_init']),
      category_id: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}category_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || entryAt != null) {
      map['entry_at'] = Variable<DateTime>(entryAt);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || isInit != null) {
      map['is_init'] = Variable<int>(isInit);
    }
    if (!nullToAbsent || category_id != null) {
      map['category_id'] = Variable<int>(category_id);
    }
    return map;
  }

  EntriesCompanion toCompanion(bool nullToAbsent) {
    return EntriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      entryAt: entryAt == null && nullToAbsent
          ? const Value.absent()
          : Value(entryAt),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      isInit:
          isInit == null && nullToAbsent ? const Value.absent() : Value(isInit),
      category_id: category_id == null && nullToAbsent
          ? const Value.absent()
          : Value(category_id),
    );
  }

  factory Entrie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Entrie(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      description: serializer.fromJson<String>(json['description']),
      entryAt: serializer.fromJson<DateTime>(json['entryAt']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      address: serializer.fromJson<String>(json['address']),
      image: serializer.fromJson<String>(json['image']),
      isInit: serializer.fromJson<int>(json['isInit']),
      category_id: serializer.fromJson<int>(json['category_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<double>(amount),
      'description': serializer.toJson<String>(description),
      'entryAt': serializer.toJson<DateTime>(entryAt),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'address': serializer.toJson<String>(address),
      'image': serializer.toJson<String>(image),
      'isInit': serializer.toJson<int>(isInit),
      'category_id': serializer.toJson<int>(category_id),
    };
  }

  Entrie copyWith(
          {int id,
          double amount,
          String description,
          DateTime entryAt,
          double latitude,
          double longitude,
          String address,
          String image,
          int isInit,
          int category_id}) =>
      Entrie(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        description: description ?? this.description,
        entryAt: entryAt ?? this.entryAt,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        address: address ?? this.address,
        image: image ?? this.image,
        isInit: isInit ?? this.isInit,
        category_id: category_id ?? this.category_id,
      );
  @override
  String toString() {
    return (StringBuffer('Entrie(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('description: $description, ')
          ..write('entryAt: $entryAt, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address, ')
          ..write('image: $image, ')
          ..write('isInit: $isInit, ')
          ..write('category_id: $category_id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          amount.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(
                  entryAt.hashCode,
                  $mrjc(
                      latitude.hashCode,
                      $mrjc(
                          longitude.hashCode,
                          $mrjc(
                              address.hashCode,
                              $mrjc(
                                  image.hashCode,
                                  $mrjc(isInit.hashCode,
                                      category_id.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Entrie &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.description == this.description &&
          other.entryAt == this.entryAt &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.address == this.address &&
          other.image == this.image &&
          other.isInit == this.isInit &&
          other.category_id == this.category_id);
}

class EntriesCompanion extends UpdateCompanion<Entrie> {
  final Value<int> id;
  final Value<double> amount;
  final Value<String> description;
  final Value<DateTime> entryAt;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String> address;
  final Value<String> image;
  final Value<int> isInit;
  final Value<int> category_id;
  const EntriesCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.description = const Value.absent(),
    this.entryAt = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.address = const Value.absent(),
    this.image = const Value.absent(),
    this.isInit = const Value.absent(),
    this.category_id = const Value.absent(),
  });
  EntriesCompanion.insert({
    this.id = const Value.absent(),
    @required double amount,
    @required String description,
    @required DateTime entryAt,
    @required double latitude,
    @required double longitude,
    @required String address,
    @required String image,
    @required int isInit,
    @required int category_id,
  })  : amount = Value(amount),
        description = Value(description),
        entryAt = Value(entryAt),
        latitude = Value(latitude),
        longitude = Value(longitude),
        address = Value(address),
        image = Value(image),
        isInit = Value(isInit),
        category_id = Value(category_id);
  static Insertable<Entrie> custom({
    Expression<int> id,
    Expression<double> amount,
    Expression<String> description,
    Expression<DateTime> entryAt,
    Expression<double> latitude,
    Expression<double> longitude,
    Expression<String> address,
    Expression<String> image,
    Expression<int> isInit,
    Expression<int> category_id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (description != null) 'description': description,
      if (entryAt != null) 'entry_at': entryAt,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (address != null) 'address': address,
      if (image != null) 'image': image,
      if (isInit != null) 'is_init': isInit,
      if (category_id != null) 'category_id': category_id,
    });
  }

  EntriesCompanion copyWith(
      {Value<int> id,
      Value<double> amount,
      Value<String> description,
      Value<DateTime> entryAt,
      Value<double> latitude,
      Value<double> longitude,
      Value<String> address,
      Value<String> image,
      Value<int> isInit,
      Value<int> category_id}) {
    return EntriesCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      entryAt: entryAt ?? this.entryAt,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      image: image ?? this.image,
      isInit: isInit ?? this.isInit,
      category_id: category_id ?? this.category_id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (entryAt.present) {
      map['entry_at'] = Variable<DateTime>(entryAt.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (isInit.present) {
      map['is_init'] = Variable<int>(isInit.value);
    }
    if (category_id.present) {
      map['category_id'] = Variable<int>(category_id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntriesCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('description: $description, ')
          ..write('entryAt: $entryAt, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address, ')
          ..write('image: $image, ')
          ..write('isInit: $isInit, ')
          ..write('category_id: $category_id')
          ..write(')'))
        .toString();
  }
}

class $EntriesTable extends Entries with TableInfo<$EntriesTable, Entrie> {
  final GeneratedDatabase _db;
  final String _alias;
  $EntriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedRealColumn _amount;
  @override
  GeneratedRealColumn get amount => _amount ??= _constructAmount();
  GeneratedRealColumn _constructAmount() {
    return GeneratedRealColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _entryAtMeta = const VerificationMeta('entryAt');
  GeneratedDateTimeColumn _entryAt;
  @override
  GeneratedDateTimeColumn get entryAt => _entryAt ??= _constructEntryAt();
  GeneratedDateTimeColumn _constructEntryAt() {
    return GeneratedDateTimeColumn(
      'entry_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  GeneratedRealColumn _latitude;
  @override
  GeneratedRealColumn get latitude => _latitude ??= _constructLatitude();
  GeneratedRealColumn _constructLatitude() {
    return GeneratedRealColumn(
      'latitude',
      $tableName,
      false,
    );
  }

  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  GeneratedRealColumn _longitude;
  @override
  GeneratedRealColumn get longitude => _longitude ??= _constructLongitude();
  GeneratedRealColumn _constructLongitude() {
    return GeneratedRealColumn(
      'longitude',
      $tableName,
      false,
    );
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn(
      'address',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isInitMeta = const VerificationMeta('isInit');
  GeneratedIntColumn _isInit;
  @override
  GeneratedIntColumn get isInit => _isInit ??= _constructIsInit();
  GeneratedIntColumn _constructIsInit() {
    return GeneratedIntColumn(
      'is_init',
      $tableName,
      false,
    );
  }

  final VerificationMeta _category_idMeta =
      const VerificationMeta('category_id');
  GeneratedIntColumn _category_id;
  @override
  GeneratedIntColumn get category_id => _category_id ??= _constructCategoryId();
  GeneratedIntColumn _constructCategoryId() {
    return GeneratedIntColumn(
      'category_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        amount,
        description,
        entryAt,
        latitude,
        longitude,
        address,
        image,
        isInit,
        category_id
      ];
  @override
  $EntriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'entries';
  @override
  final String actualTableName = 'entries';
  @override
  VerificationContext validateIntegrity(Insertable<Entrie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('entry_at')) {
      context.handle(_entryAtMeta,
          entryAt.isAcceptableOrUnknown(data['entry_at'], _entryAtMeta));
    } else if (isInserting) {
      context.missing(_entryAtMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude'], _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude'], _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address'], _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('is_init')) {
      context.handle(_isInitMeta,
          isInit.isAcceptableOrUnknown(data['is_init'], _isInitMeta));
    } else if (isInserting) {
      context.missing(_isInitMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _category_idMeta,
          category_id.isAcceptableOrUnknown(
              data['category_id'], _category_idMeta));
    } else if (isInserting) {
      context.missing(_category_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Entrie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Entrie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EntriesTable createAlias(String alias) {
    return $EntriesTable(_db, alias);
  }
}

class Categorie extends DataClass implements Insertable<Categorie> {
  final int id;
  final String name;
  final String color;
  final int isDefault;
  final int isCredit;
  final int isDebit;
  Categorie(
      {@required this.id,
      @required this.name,
      @required this.color,
      this.isDefault,
      this.isCredit,
      this.isDebit});
  factory Categorie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Categorie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      color:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
      isDefault:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}is_default']),
      isCredit:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}is_credit']),
      isDebit:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}is_debit']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || isDefault != null) {
      map['is_default'] = Variable<int>(isDefault);
    }
    if (!nullToAbsent || isCredit != null) {
      map['is_credit'] = Variable<int>(isCredit);
    }
    if (!nullToAbsent || isDebit != null) {
      map['is_debit'] = Variable<int>(isDebit);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      isDefault: isDefault == null && nullToAbsent
          ? const Value.absent()
          : Value(isDefault),
      isCredit: isCredit == null && nullToAbsent
          ? const Value.absent()
          : Value(isCredit),
      isDebit: isDebit == null && nullToAbsent
          ? const Value.absent()
          : Value(isDebit),
    );
  }

  factory Categorie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Categorie(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
      isDefault: serializer.fromJson<int>(json['isDefault']),
      isCredit: serializer.fromJson<int>(json['isCredit']),
      isDebit: serializer.fromJson<int>(json['isDebit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
      'isDefault': serializer.toJson<int>(isDefault),
      'isCredit': serializer.toJson<int>(isCredit),
      'isDebit': serializer.toJson<int>(isDebit),
    };
  }

  Categorie copyWith(
          {int id,
          String name,
          String color,
          int isDefault,
          int isCredit,
          int isDebit}) =>
      Categorie(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        isDefault: isDefault ?? this.isDefault,
        isCredit: isCredit ?? this.isCredit,
        isDebit: isDebit ?? this.isDebit,
      );
  @override
  String toString() {
    return (StringBuffer('Categorie(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('isDefault: $isDefault, ')
          ..write('isCredit: $isCredit, ')
          ..write('isDebit: $isDebit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              color.hashCode,
              $mrjc(isDefault.hashCode,
                  $mrjc(isCredit.hashCode, isDebit.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Categorie &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.isDefault == this.isDefault &&
          other.isCredit == this.isCredit &&
          other.isDebit == this.isDebit);
}

class CategoriesCompanion extends UpdateCompanion<Categorie> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> color;
  final Value<int> isDefault;
  final Value<int> isCredit;
  final Value<int> isDebit;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.isCredit = const Value.absent(),
    this.isDebit = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String color,
    this.isDefault = const Value.absent(),
    this.isCredit = const Value.absent(),
    this.isDebit = const Value.absent(),
  })  : name = Value(name),
        color = Value(color);
  static Insertable<Categorie> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> color,
    Expression<int> isDefault,
    Expression<int> isCredit,
    Expression<int> isDebit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (isDefault != null) 'is_default': isDefault,
      if (isCredit != null) 'is_credit': isCredit,
      if (isDebit != null) 'is_debit': isDebit,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> color,
      Value<int> isDefault,
      Value<int> isCredit,
      Value<int> isDebit}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      isDefault: isDefault ?? this.isDefault,
      isCredit: isCredit ?? this.isCredit,
      isDebit: isDebit ?? this.isDebit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<int>(isDefault.value);
    }
    if (isCredit.present) {
      map['is_credit'] = Variable<int>(isCredit.value);
    }
    if (isDebit.present) {
      map['is_debit'] = Variable<int>(isDebit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('isDefault: $isDefault, ')
          ..write('isCredit: $isCredit, ')
          ..write('isDebit: $isDebit')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Categorie> {
  final GeneratedDatabase _db;
  final String _alias;
  $CategoriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedTextColumn _color;
  @override
  GeneratedTextColumn get color => _color ??= _constructColor();
  GeneratedTextColumn _constructColor() {
    return GeneratedTextColumn(
      'color',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isDefaultMeta = const VerificationMeta('isDefault');
  GeneratedIntColumn _isDefault;
  @override
  GeneratedIntColumn get isDefault => _isDefault ??= _constructIsDefault();
  GeneratedIntColumn _constructIsDefault() {
    return GeneratedIntColumn(
      'is_default',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isCreditMeta = const VerificationMeta('isCredit');
  GeneratedIntColumn _isCredit;
  @override
  GeneratedIntColumn get isCredit => _isCredit ??= _constructIsCredit();
  GeneratedIntColumn _constructIsCredit() {
    return GeneratedIntColumn(
      'is_credit',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isDebitMeta = const VerificationMeta('isDebit');
  GeneratedIntColumn _isDebit;
  @override
  GeneratedIntColumn get isDebit => _isDebit ??= _constructIsDebit();
  GeneratedIntColumn _constructIsDebit() {
    return GeneratedIntColumn(
      'is_debit',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, color, isDefault, isCredit, isDebit];
  @override
  $CategoriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'categories';
  @override
  final String actualTableName = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Categorie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('is_default')) {
      context.handle(_isDefaultMeta,
          isDefault.isAcceptableOrUnknown(data['is_default'], _isDefaultMeta));
    }
    if (data.containsKey('is_credit')) {
      context.handle(_isCreditMeta,
          isCredit.isAcceptableOrUnknown(data['is_credit'], _isCreditMeta));
    }
    if (data.containsKey('is_debit')) {
      context.handle(_isDebitMeta,
          isDebit.isAcceptableOrUnknown(data['is_debit'], _isDebitMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Categorie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Categorie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(_db, alias);
  }
}

abstract class _$GeneralDatabase extends GeneratedDatabase {
  _$GeneralDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $EntriesTable _entries;
  $EntriesTable get entries => _entries ??= $EntriesTable(this);
  $CategoriesTable _categories;
  $CategoriesTable get categories => _categories ??= $CategoriesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [entries, categories];
}
