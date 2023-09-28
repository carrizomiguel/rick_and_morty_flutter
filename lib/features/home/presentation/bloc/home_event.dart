part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeCategoryChanged extends HomeEvent {
  const HomeCategoryChanged({
    required this.index,
  });

  final int index;
}
