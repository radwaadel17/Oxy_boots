import 'package:app/Parts/item%20container.dart';
import 'package:app/Parts/itemInseeall.dart';
import 'package:app/models/item%20model.dart';
import 'package:flutter/material.dart';

class SeeAllBestSellers extends StatelessWidget {
  const SeeAllBestSellers({super.key , required this.models});
 final List<ItemModel> models ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff8f9fb),
        title: const Center(
          child: Text(
            'Best Sellers',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                SizedBox(height: 25, child: Image.asset('assets/Filter.png')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.search),
          ),
        ],
      ),
      backgroundColor: const Color(0xfff8f9fb),
      body: GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: models.length,
            itemBuilder: (context, index) {
              final item = models[index];
              return itemConatinerall(item: item);
            },
          ),
    );
  }
}
