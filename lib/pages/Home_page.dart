import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice_codepur/Widgets/item_widget.dart';
import 'package:flutter_practice_codepur/Widgets/themes.dart';
import 'package:flutter_practice_codepur/models/Catalog.dart';
import 'package:velocity_x/velocity_x.dart';
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
      backgroundColor: myTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Catalogheader(),
              if (CatalogModele.items !=null && CatalogModele.items
              .isNotEmpty)
              CatalogList().expand()

              else
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          
            
          ),
        ),
      ),     
        
    );
    
  }
}

class Catalogheader extends StatelessWidget {
  const Catalogheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Catalog App".text.xl4.bold.color(myTheme.darkBluishColor)
              .make(),
              "Trending Products".text.xl .make(),
            ],
          );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModele.items.length,
      itemBuilder: ((context, index) {
        final catalog  = CatalogModele.items[index];
        return CatalogItem(catalog: catalog);
      }),
    ); 
  }
}

class CatalogItem extends StatelessWidget {
  // const CatalogItem({super.key});
   final Item catalog;
  const CatalogItem({super.key, required this.catalog})
  :assert(catalog !=null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(child: 
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              catalog.name.text.lg .color(myTheme.darkBluishColor)
              .bold.make
              (),
              catalog.desc.text.textStyle(context.captionStyle)
               .make().p1(),
               10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold. lg.make(),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: 
                      MaterialStateProperty.all(myTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(StadiumBorder())
                    ),
                    onPressed: (){

                    },
                     child: "Buy".text.make())
                ],
              ).pOnly(right: 10)
             ],
             )
          )
        ],
      )
    ).white.rounded. square(150).make().p4();
  }
}

class CatalogImage extends StatelessWidget {
  // const CatalogImage({super.key});
  final String image;
  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(
            image,
            ).box.p12.rounded. color(myTheme.creamColor)
            .make().p12().wh40(context);
  }
}