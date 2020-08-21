import 'package:floor/floor.dart';

@Entity(tableName: 'categories')
class CategoriesModel {
  @PrimaryKey(autoGenerate: true)
  final int id;

  String name;
  String color;
  int isDefault;
  int isCredit;
  int isDebit;

  CategoriesModel({
    this.id,
    this.name,
    this.color,
    this.isDefault,
    this.isCredit,
    this.isDebit,
  });

  String get getName => name;

  void setName(String name) => this.name = name;

  String get getColor => color;

  void setColor(String color) => this.color = color;

  int get getIsDefault => isDefault;

  void setIsDefault(int isDefault) => this.isDefault = isDefault;

  int get getIsCredit => isCredit;

  void setIsCredit(int isCredit) => this.isCredit = isCredit;

  int get getIsDebit => isDebit;

  void setIsDebit(int isDebit) => this.isDebit = isDebit;

  @override
  String toString() {
    return 'CategoriesModel(id: $id, name: $name, color: $color, isDefault: $isDefault, isCredit: $isCredit, isDebit: $isDebit)';
  }
}

