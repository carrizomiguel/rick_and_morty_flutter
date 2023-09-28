import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeCategoryChanged>(_onCategoryChanged);
  }

  void _onCategoryChanged(
    HomeCategoryChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        tab: HomeTab.values[event.index],
      ),
    );
  }
}
