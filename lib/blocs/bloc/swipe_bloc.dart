import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/music.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoading()) {
    on<LoadMusicsEvent>((event, emit) {
      emit(SwipeLoaded(musics: event.musics, id: event.musics[0].url.hashCode));
    });
    on<SwipeLeftEvent>((event, emit) {
      if (state is SwipeLoaded) {
        final List<Music> musics = (state as SwipeLoaded).musics;
        musics.remove(event.music);
        musics.add(event.music);
        emit(SwipeLoaded(musics: musics, id: musics[0].url.hashCode));
      }
    });
    on<SwipeRightEvent>((event, emit) {
      if (state is SwipeLoaded) {
        final List<Music> musics = (state as SwipeLoaded).musics;
        musics.remove(event.music);
        musics.add(event.music);
        emit(SwipeLoaded(musics: musics, id: musics[0].url.hashCode));
      }
    });
  }
}
