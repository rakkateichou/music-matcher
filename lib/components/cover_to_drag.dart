// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:music_matcher/const.dart';
import 'package:vector_math/vector_math_64.dart';

class CoverToDrag extends StatelessWidget {
  const CoverToDrag({
    super.key,
    required this.url,
    required this.rotation, this.shadow = true,
  });

  final bool shadow;
  final String url;
  final double rotation;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..rotateZ(rotation),
      alignment: Alignment.bottomCenter,
      child: Container(
          width: Const.albumImageSide,
          height: Const.albumImageSide,
          decoration: ShapeDecoration(
            image: DecorationImage(
                image: NetworkImage(url), fit: BoxFit.fill, isAntiAlias: true),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),
            shadows: [
              BoxShadow(
                color: shadow ? Color(0x3F000000) : Color(0x00000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          )),
    );
  }
}
