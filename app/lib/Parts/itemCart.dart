import 'package:app/cubits/total%20sum%20cubit/sumCubit.dart';
import 'package:app/models/item%20model.dart';
import 'package:app/views/item%20view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ItemCart extends StatefulWidget {
  const ItemCart({super.key, required this.item , required this.onremove , required this.itemIndex});
  final ItemModel item;
  final VoidCallback onremove;
  final int itemIndex ;
  

  @override
  State<ItemCart> createState() => _ItemCartState();
}
class _ItemCartState extends State<ItemCart> {
  int index = 1;
  double totalSum = 0;
  @override
  void initState() {
    super.initState();
     totalSum = widget.item.Price;
    BlocProvider.of<CartTotalCubit>(context).add(widget.item.Price , widget.itemIndex);
  }

  void _incrementIndex() {
    index++;
    totalSum = widget.item.Price * index;
    BlocProvider.of<CartTotalCubit>(context).add(totalSum , widget.itemIndex);
    setState(() {});
  }

  void _decrementIndex() {
    if (index > 1) {
      index--;
    }
    totalSum = widget.item.Price * index;
    BlocProvider.of<CartTotalCubit>(context).add(totalSum , widget.itemIndex);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120,
          width: 335,
          decoration: const BoxDecoration(
            color: Color(0xfff8f9fb),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Container(
                    height: 90,
                    width: 90,
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
                        '\$${(widget.item.Price * index).toStringAsFixed(2)}',
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
                                _decrementIndex();
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
                               _incrementIndex();
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
          right: 20,
          bottom: 15,
          child: GestureDetector(
            onTap: widget.onremove,
            child: SizedBox(
              height: 25,
              child: Image(image: AssetImage('assets/remove.png')))),
        ),
        
         
      ],
    
    );
  }
  
}

