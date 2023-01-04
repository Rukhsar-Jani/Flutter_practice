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
      ListView.builder(

        itemCount: CatalogModele.items.length ,
        itemBuilder: (context, index) =>
         ItemWidget(
          item:CatalogModele.items[index],
        ), 
          
            
        
      ):Center(
        child: CircularProgressIndicator(),
      ),
      drawer: myDrawer(),
    );
    
  }
}
