import 'package:flutter_playground/common/strings_constants.dart';
import 'package:flutter_playground/flutterando_screen/data/flutterando_item.dart';

const String lorenIpsum =
    """Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum""";

List<FlutterandoItem> flutterandoItens = [
  FlutterandoItem("assets/flutterando_screen/animation_icon.png",
      flutterandoAnimationTitle, flutterandoSubtitle1, 4),
  FlutterandoItem("assets/flutterando_screen/leitura_mockup_icon.png",
      flutterandoMockupRead, flutterandoSubtitle2, 2),
  FlutterandoItem("assets/flutterando_screen/playground_icon.png",
      flutterandoPlayground, flutterandoSubtitle3, 3),
];
