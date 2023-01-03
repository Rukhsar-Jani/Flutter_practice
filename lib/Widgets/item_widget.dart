import 'package:flutter/material.dart';
import 'package:flutter_practice_codepur/models/Catalog.dart';


class ItemWidget extends StatelessWidget{

final Item item;

  const ItemWidget({Key? key,  required this.item})
   :assert(item != null),
   super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          child: ListTile(
            leading: Image.network(item.image),
            title: Text(item.name),
            subtitle: Text(item.desc),
            trailing: Text("\$${item.price}"),
        
          ),
        ),
      ),
    );
  }
}
 