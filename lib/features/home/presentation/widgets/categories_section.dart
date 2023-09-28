import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/features.dart';
import 'package:rickandmorty/shared/shared.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSliverDelegate(
      pinned: true,
      height: 70,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 30,
        ),
        color: Colors.white,
        child: SizedBox(
          height: 50,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final currentTab = state.tab;

              return ListView.builder(
                itemCount: HomeTab.values.length,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final isSelected = index == currentTab.index;

                  return _CategoryItem(
                    index: index,
                    isSelected: isSelected,
                    name: HomeTab.values[index].name,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.index,
    required this.isSelected,
    required this.name,
  });

  final int index;
  final bool isSelected;
  final String name;

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();

    return GestureDetector(
      onTap: () => homeBloc.add(
        HomeCategoryChanged(
          index: index,
        ),
      ),
      child: Container(
        width: Layout.setWidth(context, 25),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        alignment: Alignment.center,
        // margin: EdgeInsets.only(
        //   left: index == 0 ? 30 : 0,
        //   right: isSelected ? 30 : 15,
        // ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
