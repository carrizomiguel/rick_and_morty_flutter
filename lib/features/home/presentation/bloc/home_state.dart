part of 'home_bloc.dart';

enum HomeStatus {
  loading,
  success,
  error,
}

enum HomeTab {
  characters('Characters'),
  episodes('Episodes');

  const HomeTab(this.name);

  final String name;
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.loading,
    this.tab = HomeTab.characters,
  });

  final HomeStatus status;
  final HomeTab tab;

  HomeState copyWith({
    HomeStatus? status,
    HomeTab? tab,
  }) {
    return HomeState(
      status: status ?? this.status,
      tab: tab ?? this.tab,
    );
  }

  @override
  List<Object> get props => [
        status,
        tab,
      ];
}
