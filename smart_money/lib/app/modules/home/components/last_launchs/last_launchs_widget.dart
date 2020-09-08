import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocoder/geocoder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:smart_money/app/shared/databases/dao/entries_dao.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

import '../../../../../app/components/card/card_widget.dart';
import '../../../../../app/modules/home/components/chart_categories/components/indicator.dart';
import '../../../../../app/modules/home/home_controller.dart';

class LastLaunchsWidget extends StatelessWidget {
  final HomeController controller;

  LastLaunchsWidget({this.controller});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      children: <Widget>[
        ListTile(
          leading: Text('Últimos Lançamentos', style: TextStyle(color: Colors.white)),
        ),
        Container(
          width: double.maxFinite,
          height: 200,
          child: StreamBuilder<List<dynamic>>(
            stream: controller.getEntryCategory(),
            builder: (context, snapshot) {
              
              if(!snapshot.hasData) return Container();

              List<EntryWithCategory> entries = snapshot.data;
            

              return ListView.separated(
                itemCount: entries.length,
                itemBuilder: (_, index) {
                  String formattedDate = DateFormat('dd/MM kk:mm').format(entries[index].entrie.entryAt);
                  
                  Entrie genericObject = Entrie(
                    id: entries[index].entrie.id, 
                    amount: entries[index].entrie.amount, 
                    description: entries[index].entrie.description, 
                    entryAt: entries[index].entrie.entryAt, 
                    latitude: entries[index].entrie.latitude, 
                    longitude: entries[index].entrie.longitude, 
                    address: entries[index].entrie.address, 
                    image: entries[index].entrie.image, 
                    isInit: entries[index].entrie.isInit, 
                    category_id: entries[index].entrie.category_id
                  );

                  return SizedBox(
                    height: 60,
                    child: ListTile(
                    title: Indicator(
                      color: Hexcolor('${entries[index].colorCategorie}'),
                      text: '${entries[index].nameCategorie} - ${entries[index].entrie.description ?? ""}',
                      isSquare: false,
                      textColor: Colors.white,
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Row(
                        children: [
                          Icon(Icons.access_time, color: Colors.grey, size: 14),
                          SizedBox(width: 2), 
                          Text(formattedDate, style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 4), 
                          Icon(Icons.pin_drop, color: Colors.grey, size: 16),
                          Text('${entries[index].entrie.address ?? "Sem endereço"}', style: TextStyle(color: Colors.grey, fontSize: 11)),
                        ],
                      ),
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.only(bottom: 18),
                      child: Text('R\$ ${entries[index].entrie.amount}', style: TextStyle(color: Colors.white)),
                    ),
                    onTap: () {
                      Modular.to.pushNamed('/launch/', arguments: genericObject);
                    },
                  ),
                  );
                },
                separatorBuilder: (_, __) {
                  return Divider();
                },
              );
            },
          )
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}

