import 'package:app/models/item%20model.dart';
import 'package:flutter/material.dart';

class NewArrivalscontainer extends StatelessWidget {
  const NewArrivalscontainer({super.key, required this.item});

  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 335,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
             // image: DecorationImage(image: AssetImage(item.img)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Text(
                        item.txt,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        item.type,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '\$${item.Price}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: SizedBox(
                      height: 60,
                      child: Image(image: NetworkImage(item.img))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
