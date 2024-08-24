import 'package:app/models/item%20model.dart';
import 'package:flutter/material.dart';

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
            image: DecorationImage(image: AssetImage(item.img)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.txt,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  item.type,
                  style: TextStyle(
                      color: const Color.fromARGB(255, 34, 34, 34),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  item.Price,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 39, 39, 39),
                    fontSize: 15,
                    // fontWeight: FontWeight.bold
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
            onTap: (){
              Navigator.pushNamed(context , 'fav');
            },
            child: Image.asset('assets/Group 107.png'))),
      )
    ],
    );
  }
}
