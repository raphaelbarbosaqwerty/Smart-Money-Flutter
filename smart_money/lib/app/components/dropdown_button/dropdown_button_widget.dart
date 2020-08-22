// import 'package:crm_one_flutter/app/modules/login/submodules/webservice/models/webservice_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/shared/database/tables/categories/models/categories_model.dart';

class DropdownButtonWidget extends StatelessWidget {
  
  final List<CategoriesModel> listDatabases;
  final onChanged;
  final value;
  final hint;
  
  const DropdownButtonWidget({Key key, this.listDatabases, this.onChanged, this.value, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        iconEnabledColor: Colors.white,
        iconDisabledColor: Colors.black,
        hint: hint,
        value: value,
        isExpanded: true,
        onChanged: onChanged,
        dropdownColor: Hexcolor('34495e'),
        style: TextStyle(color: Colors.white),
        items: listDatabases?.map((map) {
          return DropdownMenuItem<String>(
            value: map.name.toString(),
            child: Text(
              map.name.toString(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          );
        })?.toList(),
      )
    );
  }
}
