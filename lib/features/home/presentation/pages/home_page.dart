import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_repository/rick_and_morty_repository.dart';
import 'package:rickandmorty/core/core.dart';
import 'package:rickandmorty/features/episode/presentation/widgets/episodes_lazy_loader.dart';
import 'package:rickandmorty/features/features.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => CharacterListBloc(
            repository: context.read<RickAndMortyRepository>(),
          )..add(CharacterListRequested()),
        ),
        BlocProvider(
          create: (context) => EpisodeBloc(
            repository: context.read<RickAndMortyRepository>(),
          )..add(EpisodeListRequested()),
        ),
      ],
      child: const HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late ScrollController _controller;
  bool requestMore = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() => requestMore = true);
      return;
    }
    setState(() => requestMore = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          Assets.logo,
          fit: BoxFit.contain,
          height: 45,
        ),
        shadowColor: Colors.white,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            controller: _controller,
            slivers: [
              const SearchField(),
              const CategoriesSection(),
              if (state.tab == HomeTab.characters) ...[
                CharactersList(
                  requestMore: requestMore,
                ),
                const CharactersLazyLoading(),
              ] else if (state.tab == HomeTab.episodes) ...[
                EpisodesList(
                  requestMore: requestMore,
                ),
                const EpisodesLazyLoading(),
              ],
            ],
          );
        },
      ),
    );
  }
}
