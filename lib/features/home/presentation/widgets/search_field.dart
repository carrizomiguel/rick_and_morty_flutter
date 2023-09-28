import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/features.dart';
import 'package:rickandmorty/shared/shared.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSliverDelegate(
      floating: true,
      height: 90,
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 30,
        ),
        child: OpenContainer(
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          closedElevation: 0,
          transitionType: ContainerTransitionType.fadeThrough,
          openBuilder: (_, action) => BlocProvider.value(
            value: context.read<HomeBloc>(),
            child: const SearchPage(),
          ),
          closedBuilder: (context, action) => Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F1F3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                const SizedBox(width: 5),
                Text(
                  'Search...',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
