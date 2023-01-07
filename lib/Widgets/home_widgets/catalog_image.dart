
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_practice_codepur/Widgets/themes.dart';


class CatalogImage extends StatelessWidget {
  // const CatalogImage({super.key});
  final String image;

  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(
            image,
            
            ).box.p12.rounded. color(myTheme.creamColor,)
            .make().p12().wh40(context);
  }
}