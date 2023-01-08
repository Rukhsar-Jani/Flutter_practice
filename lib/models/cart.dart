

import 'package:flutter_practice_codepur/models/Catalog.dart';

class CartModel{
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;
    // catalog fields
  late CatalogModele  _catalog;

  final List<int> _itemIds = [];
   
   CatalogModele get catalog => _catalog;

   set catalog(CatalogModele newCatalog){
    assert(newCatalog!=null);
    _catalog = newCatalog;

   }
   List<Item> get items => _itemIds.map((id) => 
    _catalog.getById(id)).toList();

    num get totalprice =>
    items.fold(0, (total, current) => total + current.price);

    // add item
    void add(Item item){

    _itemIds.add(item.id);
    }
        // remove items
      void remove (Item item){
        _itemIds.remove(item.id);
      }
}