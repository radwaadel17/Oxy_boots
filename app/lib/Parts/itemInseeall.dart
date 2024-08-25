import 'package:app/cubits/favourite%20cubit/favCubit.dart';
import 'package:app/models/item%20model.dart';
import 'package:app/views/item%20view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class itemConatinerall extends StatelessWidget {
  const itemConatinerall({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
           return ItemDetails(item: item);
        }));
      },
      child: Stack(
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
                      'mens-shoes',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
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
                      '\$${item.Price}',
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
          const Positioned(
              right: 15,
              bottom: 8,
              child: SizedBox(
                height: 20,
                child: Row(
                  children: [
                    Image(image: AssetImage('assets/Ellipse 895.png')),
                    Image(image: AssetImage('assets/Ellipse 896.png')),
                  ],
                ),
            )),
        ],
      ),
    );
  }
}
