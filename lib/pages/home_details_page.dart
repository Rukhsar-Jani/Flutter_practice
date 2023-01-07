import 'package:flutter/material.dart';
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
         color: myTheme.creamColor,
         child: ButtonBar(
        
      alignment: MainAxisAlignment.spaceBetween,
      buttonPadding: EdgeInsets.zero,
      
      children: [
        // h15(context),
      "\$${catalog.price}".text.color(myTheme.darkBluishColor).bold. 
       xl2.make(),
      ElevatedButton(
      style: ButtonStyle(
            backgroundColor: 
            MaterialStateProperty.all(myTheme.darkBluishColor),
            shape: MaterialStateProperty.all(StadiumBorder())
            ),
              onPressed: (){},
            child: "Add to cart". text.color(myTheme.creamColor).xl.bold.make()
            ).wh(120, 45)
              ],
            ).pOnly(right: 10).p8(),
       ),
      backgroundColor: myTheme.creamColor,
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
                  color: myTheme.darkBluishColor,
                  width: context.screenWidth,
                  // COLUMN
                  child: Column(
                    children: [
                   catalog.name.text.xl4 .color(Colors.white)
                   .bold.make(),
                catalog.desc.text. 
                color(Colors.white60).textStyle(context.captionStyle).xl
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