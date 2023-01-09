import 'package:flutter/material.dart';
import 'package:flutter_practice_codepur/Widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_practice_codepur/Widgets/themes.dart';
import 'package:flutter_practice_codepur/models/Catalog.dart';
import 'package:velocity_x/velocity_x.dart';


class HomeDetailpage extends StatelessWidget {
  // const homeDetailpage({super.key});
   final Item catalog;

  const HomeDetailpage({super.key, required 
    this.catalog}):assert(catalog!=null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      
      bottomNavigationBar: 
       Container(
        //height: 80,
         color: myTheme.darkcreamcolor,
         child: ButtonBar(
        
      alignment: MainAxisAlignment.spaceBetween,
      buttonPadding: EdgeInsets.zero,
      
      children: [
        // h15(context),
      "\$${catalog.price}".text.color(myTheme.creamColor).bold. 
       xl2.make(),
     AddTocart(catalog: catalog,).wh(120, 45)
              ],
            ).pOnly(right: 10).p8(),
       ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        // bottom: false,
        child: Column(
          children: [
            Hero( 
                 tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
              ).h48(context),
              Expanded(child: VxArc(
                height: 35,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.accentColor,
                  width: context.screenWidth,
                  // COLUMN
                  child: Column(
                    children: [
                   catalog.name.text.xl4 .color(context.canvasColor)
                   .bold.make(),
                catalog.desc.text. 
          color(context.canvasColor).textStyle(context.captionStyle).xl
                .make().p1(),
                10.heightBox,
                    ],
                  ).py(48),
                ),
              ),
              ),
          ]),
      ),
    );
  }
}