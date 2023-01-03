import 'package:flutter/material.dart';
import 'package:flutter_practice_codepur/Widgets/item_widget.dart';
import 'package:flutter_practice_codepur/models/Catalog.dart';
import 'package:meta/meta.dart';

import '../Widgets/drawer.dart';

class Homepage extends StatelessWidget {
  get items => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(//backgroundColor: Colors.black,
        title: Text('Catalog App',style: TextStyle(color: Colors.black),),
      ),
      body: ListView.builder(

        itemCount: CatalogModele.items.length ,
        itemBuilder: (context, index) {
        return ItemWidget(
          item:CatalogModele.items[index],
        ); 
          
            
        },
      ),
      drawer: myDrawer(),
    );
    
  }
}
