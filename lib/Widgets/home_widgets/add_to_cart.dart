

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/Catalog.dart';
import '../../models/cart.dart';

class AddTocart extends StatefulWidget {
  final Item catalog;
  const AddTocart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddTocart> createState() => _AddTocartState();
}

class _AddTocartState extends State<AddTocart> {
          final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
      bool isInCart = _cart.items.contains(widget.catalog);
    return  ElevatedButton(
      onPressed: () {
        if(!isInCart){
        isInCart = isInCart.toggle();
        final _catalog = CatalogModele();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
        }
      },
       style: ButtonStyle(
        backgroundColor: 
        MaterialStateProperty.all(context.accentColor),
        shape: MaterialStateProperty.all(StadiumBorder())
        ),
        child:isInCart ? Icon(Icons.done): 
          Icon(CupertinoIcons.cart_badge_plus)
        );
  }
}