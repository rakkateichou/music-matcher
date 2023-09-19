part of 'swipe_bloc.dart';

@immutable
sealed class SwipeState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SwipeLoading extends SwipeState {}

final class SwipeLoaded extends SwipeState {
  final List<Music> musics;
  final int id;

  SwipeLoaded({required this.musics, required this.id});

  @override
  List<Object?> get props => [musics, id];
}

final class SwipeError extends SwipeState {}
