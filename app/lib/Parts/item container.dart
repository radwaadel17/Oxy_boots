import 'package:app/cubits/favourite%20cubit/favCubit.dart';
import 'package:app/models/item%20model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class itemConatiner extends StatelessWidget {
  const itemConatiner({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Adding a container for the image with a bottom margin
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Image.network(
                      item.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    item.txt,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    item.type,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 34, 34, 34),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${item.Price}',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 39, 39, 39),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 10,
          child: SizedBox(
            height: 45,
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<FavouriteCubit>(context).addFav(item);
                Navigator.pushNamed(context, 'fav');
              },
              child: Image.asset('assets/Group 107.png'),
            ),
          ),
        ),
      ],
    );
  }
}
