// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_practice_codepur/Widgets/themes.dart';
import 'package:flutter_practice_codepur/models/Catalog.dart';
import 'package:flutter_practice_codepur/pages/home_details_page.dart';

import '../../models/cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModele.items.length,
      itemBuilder: ((context, index) {
        final catalog  = CatalogModele.items[index];
        return InkWell(
          onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => 
          HomeDetailpage(catalog: catalog
            )
            )
            ),

          child: CatalogItem(catalog: catalog),
        );
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
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
            Expanded(child: 
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              catalog.name.text.lg .color(context.accentColor)
              .bold.make
              (),
              catalog.desc.text.textStyle(context.captionStyle)
               .make().p1(),
               10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                buttonPadding: EdgeInsets.zero,
                
                children: [
                  "\$${catalog.price}".text.bold. lg.make(),
                  _AddTocart(catalog: catalog),
                  // ElevatedButton(
                  //   style: ButtonStyle(
                  //     backgroundColor: 
                  //     MaterialStateProperty.all(context.accentColor),
                  //     shape: MaterialStateProperty.all(StadiumBorder())
                  //   ),
                  //   onPressed: (){
                  //   },
                  //    child: "Add to cart".text
                  //    .color(context.cardColor).make()
                  //    )
                ],
              ).pOnly(right: 2)
             ],
             )
          )
        ],
      )
    ).color(context.cardColor ).rounded. square(150).make().p4();
  }
}

class _AddTocart extends StatefulWidget {
  final Item catalog;
  const _AddTocart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_AddTocart> createState() => __AddTocartState();
}

class __AddTocartState extends State<_AddTocart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModele();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
       style: ButtonStyle(
        backgroundColor: 
        MaterialStateProperty.all(context.accentColor),
        shape: MaterialStateProperty.all(StadiumBorder())
        ),
        child:isAdded ? Icon(Icons.done):"Add to cart".text
        .color(context.cardColor).make()
        );
  }
}
