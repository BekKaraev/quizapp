import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconWidget extends StatelessWidget {
  final IconData icons;
  final Color color;
  const IconWidget({
    this.icons,
    this.color,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.only(left: 20.0),
        child: FaIcon(
          icons,
          color: color,
          size: 45.0,
        ));
    ;
  }
}