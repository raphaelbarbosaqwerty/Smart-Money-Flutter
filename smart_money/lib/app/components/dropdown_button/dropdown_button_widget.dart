// import 'package:crm_one_flutter/app/modules/login/submodules/webservice/models/webservice_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

class DropdownButtonWidget extends StatelessWidget {
  
  final List<Categorie> listDatabases;
  final onChanged;
  final value;
  final hint;
  
  const DropdownButtonWidget({Key key, this.listDatabases, this.onChanged, this.value, this.hint}) : super(key: key);

  // TODO - When you have objects on DropDown use as Object.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<Categorie>(
        iconEnabledColor: Colors.white,
        iconDisabledColor: Colors.black,
        hint: hint,
        value: value,
        isExpanded: true,
        onChanged: onChanged,
        dropdownColor: Hexcolor('34495e'),
        style: TextStyle(color: Colors.white),
        items: listDatabases?.map((Categorie map) {
          return DropdownMenuItem<Categorie>(
            value: map,
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
