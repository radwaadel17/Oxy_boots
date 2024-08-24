import 'package:flutter/material.dart';
class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color(0xfff8f9fb),
    appBar: AppBar(
      title: const Center(
        child: Text('Favourite' , 
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
     )
    );
  }
}