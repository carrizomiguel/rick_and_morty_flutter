part of 'episode_bloc.dart';

enum EpisodeStatus {
  initial,
  loading,
  success,
  error,
}

class EpisodeState extends Equatable {
  const EpisodeState({
    this.status = EpisodeStatus.loading,
    this.episodes = const [],
    this.page = (1, 1),
  });

  final EpisodeStatus status;
  final List<EpisodeModel> episodes;
  // First number is the current page and
  // the second one the number of pages
  final (int, int) page;

  EpisodeState copyWith({
    EpisodeStatus? status,
    List<EpisodeModel>? episodes,
    (int, int)? page,
  }) {
    return EpisodeState(
      status: status ?? this.status,
      episodes: episodes ?? this.episodes,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [
        status,
        episodes,
        page,
      ];
}
