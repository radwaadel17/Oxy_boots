import 'package:app/Parts/item%20container.dart';
import 'package:app/models/item%20model.dart';
import 'package:flutter/material.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({super.key});
  final List<ItemModel> ListModel = const [
    ItemModel(
        Price: '493.50',
        txt: 'Best seller',
        type: 'Nike Jordan',
        img: 'assets/Frame 250.png'),
    ItemModel(
      Price: '250.00',
      txt: 'Best seller',
      type: 'Nike',
      img: 'assets/Frame.png',
    ),
    ItemModel(
      Price: '493.5',
      txt: 'Best seller',
      type: 'Nike Air Max',
      img: 'assets/Frame 250.png',
    ),
    ItemModel(
      Price: '493.5',
      txt: 'Best seller',
      type: 'Nike',
      img: 'assets/Frame.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ListModel.length,
          itemBuilder: (context, cnt) {
            return itemConatiner(item: ListModel[cnt]);
          },
        ),
      ),
    );
  }
}

