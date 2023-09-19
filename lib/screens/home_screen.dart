// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter/src/material/icon_button.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_matcher/blocs/bloc/swipe_bloc.dart';

import '../components/choice_button.dart';
import '../components/cover_to_drag.dart';
import '../components/draggable_albums.dart';
import '../models/music.dart';

class HomeScreen extends StatelessWidget {
  
  HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 85),
          child: Text(
            'Now Playing',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        BlocBuilder<SwipeBloc, SwipeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 47),
              child: Text(
                state is SwipeLoaded ? "${state.musics[0].artist} - ${state.musics[0].title}" : "Loading",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
        ),
        Container(
          margin: EdgeInsets.only(top: 66),
          child: DraggableAlbums(),
        ),
        Container(
          margin: EdgeInsets.only(top: 36),
          width: 75,
          height: 75,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("Bars.gif"),
                  colorFilter:
                      ColorFilter.mode(Color(0xFFF2F2F3), BlendMode.srcIn))),
        ),
        Container(
          margin: EdgeInsets.only(left: 57, top: 47, right: 57, bottom: 0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ChoiceButton(asset: "discard.svg"),
            ChoiceButton(asset: "like.svg"),
            ChoiceButton(asset: "later.svg"),
          ]),
        ),
      ],
    );
  }
}
