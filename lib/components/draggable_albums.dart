// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_matcher/components/cover_to_drag.dart';
import 'package:music_matcher/const.dart';
import 'package:music_matcher/screens/home_screen.dart';

import '../blocs/bloc/swipe_bloc.dart';
import '../models/music.dart';

class DraggableAlbums extends StatefulWidget {
  const DraggableAlbums({
    super.key,
  });

  @override
  State<DraggableAlbums> createState() => _DraggableAlbumsState();
}

class _DraggableAlbumsState extends State<DraggableAlbums>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  double _firstOpacity = 1;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwipeBloc, SwipeState>(
      builder: (context, state) {
        if (state is SwipeLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SwipeError) {
          return Center(
            child: Text("Error"),
          );
        }
        Music getNext(int offset) {
          return (state as SwipeLoaded).musics[offset % state.musics.length];
        }

        var currentAlbum =
            CoverToDrag(url: getNext(0).albumArtUrl, rotation: 0);
        return AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => Stack(
                  children: [
                    CoverToDrag(
                        url: getNext(3).albumArtUrl,
                        rotation: 0.15,
                        shadow: _animation.value > 0),
                    CoverToDrag(
                        url: getNext(2).albumArtUrl,
                        rotation: (1 - _animation.value * 2) * 0.15),
                    CoverToDrag(
                        url: getNext(1).albumArtUrl,
                        rotation: (1 - _animation.value) * -0.15),
                    Draggable(
                      feedback: currentAlbum,
                      child:
                          Opacity(opacity: _firstOpacity, child: currentAlbum),
                      onDragStarted: () {
                        setState(() {
                          _firstOpacity = 0;
                        });
                        _animationController.forward();
                      },
                      onDragEnd: (drag) => {
                        setState(() {
                          _firstOpacity = 1;
                        }),
                        if (drag.offset.dx > 220)
                          {
                            BlocProvider.of<SwipeBloc>(context)
                                .add(SwipeRightEvent(music: getNext(0))),
                            _animationController.reset()
                          }
                        else if (drag.offset.dx < 15)
                          {
                            BlocProvider.of<SwipeBloc>(context)
                                .add(SwipeLeftEvent(music: getNext(0))),
                            _animationController.reset()
                          }
                        else
                          {_animationController.reverse()},
                      },
                    ),
                  ],
                ));
      },
    );
  }
}
