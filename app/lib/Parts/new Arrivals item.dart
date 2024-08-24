import 'package:app/Parts/item%20container.dart';
import 'package:app/Parts/new%20arrivals%20container.dart';
import 'package:app/models/item%20model.dart';
import 'package:flutter/material.dart';

class NewArrivalsItem extends StatelessWidget {
  const NewArrivalsItem({super.key , required this.ListModel});
  final List<ItemModel> ListModel ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ListModel.length,
          itemBuilder: (context, cnt) {
            return NewArrivalscontainer(item: ListModel[cnt]);
          },
        ),
      ),
    );
  }
}

