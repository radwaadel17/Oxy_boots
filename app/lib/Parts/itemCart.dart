import 'package:app/models/item%20model.dart';
import 'package:app/views/item%20view.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  const ItemCart({super.key, required this.item , required this.onremove});
  final ItemModel item;
  final VoidCallback onremove;
  @override
  State<ItemCart> createState() => _ItemCartState();
}

List<int> Sizes = [37, 38, 39, 40, 41, 42];

class _ItemCartState extends State<ItemCart> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: 335,
          decoration: const BoxDecoration(
            color: Color(0xfff8f9fb),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Container(
                    height: 85,
                    width: 87,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.item.img)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: Text(
                        widget.item.type,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '\$${widget.item.Price * index}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 5),
                            child: GestureDetector(
                              onTap: () {
                                if (index >= 2) {
                                  index = index - 1;
                                  setState(() {});
                                }
                              },
                              child: Image(
                                  image: AssetImage('assets/Group 61.png')),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            '$index',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16, top: 5),
                            child: GestureDetector(
                              onTap: () {
                                index = index + 1;

                                setState(() {});
                              },
                              child: Image(
                                  image: AssetImage('assets/Group 60.png')),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: widget.onremove, // Call the callback to remove item
          ),
        ),
      ],
    );
  }
}
