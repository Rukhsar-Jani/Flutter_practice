import 'package:flutter/material.dart';
import 'package:flutter_practice_codepur/Widgets/themes.dart';
import 'package:flutter_practice_codepur/models/Catalog.dart';
import 'package:velocity_x/velocity_x.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 'Cart'.text.make(),
      ),
      backgroundColor: context.canvasColor,

      body: Column(children: [
          _CartList().p24().expand(),
          Divider(),
          _CartTotal(),
      ],),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9990".text.xl4.color(context.accentColor).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: 
               MaterialStateProperty.all(context.theme.buttonColor)), 
                child: "Buy".text.white.make()
               ).wh(80, 35),
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _nameState();
}

class _nameState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context,  index) => const ListTile(
        leading: Icon(Icons.done_sharp),
        trailing: Icon(Icons.remove_circle_outline_outlined),
         // title: "Shaheen 2".text.make(),
         ),
      );
      

  }
}