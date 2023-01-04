import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice_codepur/Widgets/item_widget.dart';
import 'package:flutter_practice_codepur/models/Catalog.dart';
import 'dart:convert'; 
import '../Widgets/drawer.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  get items => null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData() async {
    await Future.delayed(Duration(seconds: 2));
  final  catalogJson = await rootBundle.loadString('assets/files/catalog.json');
  final decodedData =  jsonDecode(catalogJson);
  var productsData = decodedData["products"];

  CatalogModele.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
   setState(() {
     
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(//backgroundColor: Colors.black,
        title: Text('Catalog App',style: TextStyle(color: Colors.black),),
      ),
      body: (CatalogModele.items !=null && CatalogModele.items.isNotEmpty)? 
        Padding(
          padding: EdgeInsets.all(12),
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 10,
            
            ),
            
           itemBuilder:  (context, index) {
            final item = CatalogModele.items[index];
             return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(12) ),
              child: GridTile(
                header: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                  child: Text(item.name,style: TextStyle(color: Colors.white),),
                  padding: const EdgeInsets.all(12),
                  ),
                child: Image.network(item.image),
                footer: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),

                  child: Text(item.price.toString(),
                  style: TextStyle(color: Colors.white),
                  ),
                  padding: const EdgeInsets.all(12),
                  ),
                  ),
                );
                
           },
           
          itemCount: CatalogModele.items.length ,),
        )
          
            
        
      :Center(
        child: CircularProgressIndicator(),
      ),
      drawer: myDrawer(),
    );
    
  }
}
