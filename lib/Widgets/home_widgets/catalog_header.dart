
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_practice_codepur/Widgets/themes.dart';


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
