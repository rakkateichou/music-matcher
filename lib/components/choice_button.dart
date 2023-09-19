// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter/src/material/icon_button.dart';
import 'package:flutter/src/painting/box_shadow.dart';
import 'package:flutter/src/painting/oval_border.dart';
import 'package:flutter/src/painting/shape_decoration.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class ChoiceButton extends StatelessWidget {
  const ChoiceButton({
    super.key,
    required this.asset,
  });

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(shape: OvalBorder(), shadows: [
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(3, 3),
            blurRadius: 3)
      ]),
      child: IconButton(onPressed: () {}, icon: SvgPicture.asset(asset)),
    );
  }
}
