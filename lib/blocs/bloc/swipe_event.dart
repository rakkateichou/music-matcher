part of 'swipe_bloc.dart';

@immutable
sealed class SwipeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadMusicsEvent extends SwipeEvent {
  final List<Music> musics;

  LoadMusicsEvent({required this.musics});

  @override
  List<Object?> get props => [musics];
}

class SwipeLeftEvent extends SwipeEvent {
  final Music music;

  SwipeLeftEvent({required this.music});

  @override
  List<Object?> get props => [music];
}

class SwipeRightEvent extends SwipeEvent {
  final Music music;

  SwipeRightEvent({required this.music});

  @override
  List<Object?> get props => [music];
}
