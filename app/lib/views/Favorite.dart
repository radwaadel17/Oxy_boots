import 'package:app/Parts/item%20container.dart';
import 'package:app/cubits/favourite%20cubit/favCubit.dart';
import 'package:app/cubits/favourite%20cubit/favStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fb),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Favourite',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      body: BlocBuilder<FavouriteCubit, FavState>(builder: (context, state) {
        if (state is FavLoaded) {
          return GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: state.favs.length,
            itemBuilder: (context, index) {
              final item = state.favs[index];
              return itemConatiner(item: item);
            },
          );
        } else {
          return const Center(child: Text('No favorites added yet.'));
        }
      }),
    );
  }
}
