import 'package:floor/floor.dart';
import 'package:smart_money/app/shared/database/tables/categories/models/categories_model.dart';

@Entity(
  tableName: 'entries',
  foreignKeys: [
    ForeignKey(
      childColumns: ['category_id'],
      parentColumns: ['id'],
      entity: CategoriesModel
    )
  ]
)
class EntriesModel {
  @PrimaryKey(autoGenerate: true)
  final int id;

  double amount;
  String description;
  String entryAt;
  double latitude;
  double longitude;
  String address;
  String image;
  int isInit;

  @ColumnInfo(name: 'category_id')
  int categoryId;

  EntriesModel({
    this.id,
    this.amount,
    this.description,
    this.entryAt,
    this.latitude,
    this.longitude,
    this.address,
    this.image,
    this.isInit,
    this.categoryId,
  });

  double get getAmount => amount;

  set setAmount(double amount) => this.amount = amount;

  String get getDescription => description;

  set setDescription(String description) => this.description = description;

  String get getEntryAt => entryAt;

  set setEntryAt(String entryAt) => this.entryAt = entryAt;

  double get getLatitude => latitude;

  set setLatitude(double latitude) => this.latitude = latitude;

  double get getLongitude => longitude;

  set setLongitude(double longitude) => this.longitude = longitude;

  String get getAddress => address;

  set setAddress(String address) => this.address = address;

  String get getImage => image;

  set setImage(String image) => this.image = image;

  int get getIsInit => isInit;

  set setIsInit(int isInit) => this.isInit = isInit;

  int get getCategoryId => categoryId;

  set setCategoryId(int categoryId) => this.categoryId = categoryId;

  @override
  String toString() {
    return 'EntriesModel(id: $id, amount: $amount, description: $description, entryAt: $entryAt, latitude: $latitude, longitude: $longitude, address: $address, image: $image, isInit: $isInit, categoryId: $categoryId)';
  }
}
