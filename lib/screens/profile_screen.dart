import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_matcher/components/choice_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 630,
          decoration: const ShapeDecoration(
            color: Color(0xFFF2F2F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 54),
                child: SvgPicture.asset("profile_top.svg"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Stack(
                  children: [
                    SvgPicture.asset("user_icon.svg"),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(onPressed: () {}, icon: SvgPicture.asset("edit_photo.svg")))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 17),
                height: 23,
                child: const Text(
                  'Your Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF292D32),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.10,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 31),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: SvgPicture.asset("likes.svg")),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("settings.svg"))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 17),
                child: IconButton(
                    onPressed: () {}, icon: SvgPicture.asset("logout.svg")),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 85),
          child: const Text(
            'MusicMatch',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFF2F2F3),
              fontSize: 37,
              fontStyle: FontStyle.italic,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w100,
              height: 0,
            ),
          ),
        )
      ],
    );
  }
}
