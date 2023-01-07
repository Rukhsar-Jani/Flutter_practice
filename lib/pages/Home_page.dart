import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice_codepur/Widgets/item_widget.dart';
import 'package:flutter_practice_codepur/Widgets/themes.dart';
import 'package:flutter_practice_codepur/models/Catalog.dart';
import 'package:flutter_practice_codepur/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert'; 
import '../Widgets/drawer.dart';
import '../Widgets/home_widgets/catalog_header.dart';
import '../Widgets/home_widgets/catalog_list.dart';

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
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: (() => Navigator.pushNamed(context, 
         Myroutes.cartRoute)),
        backgroundColor: context.theme.buttonColor,
        child: Icon(CupertinoIcons.cart, color: Colors.white,),
        
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Catalogheader(),
              if (CatalogModele.items !=null && CatalogModele.items
              .isNotEmpty)
              CatalogList().expand()

              else
                   CircularProgressIndicator().py12().expand(),
              
            ],
          ),
        ),
      ), 
    );
  }
}

