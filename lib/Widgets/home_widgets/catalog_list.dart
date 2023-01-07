
import 'package:flutter/material.dart';
import 'package:flutter_practice_codepur/models/Catalog.dart';
import 'package:flutter_practice_codepur/Widgets/themes.dart';
import 'package:flutter_practice_codepur/pages/home_details_page.dart';
import 'package:velocity_x/velocity_x.dart';

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
