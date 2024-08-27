import 'package:app/Parts/itemCart.dart';
import 'package:app/core/utlis/size%20config%20model.dart';
import 'package:app/cubits/cart%20cubit.dart/cartCubit.dart';
import 'package:app/cubits/total%20sum%20cubit/sumCubit.dart';
import 'package:app/models/item%20model.dart';
import 'package:app/views/Cart%20view.dart';
import 'package:app/views/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key, required this.item});
  final ItemModel item;

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  int selectedIndex = 2;
  int selectedIndex2 = 1;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff8f9fb),
        actions: [
           SizedBox(
                height: 45,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CartView();
                    }));
                  },
                  child: SizedBox(
                    height: 210,
                    child: Image.asset('assets/Group 27.png'))),
              ),
        ],
        
        title: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: const Center(
            child: Text(
              "Men's Shoes",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: ListView(
        children: [
          SizedBox(
            height: 225,
            width: 311,
            child: Image.network(widget.item.img)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  widget.item.txt,
                  style: TextStyle(
                      color: Color(0xff5B9EE1),
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  widget.item.type,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  '\$${widget.item.Price}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.item.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, color: Color(0xff707B81)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  'Gallery',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                        color: Color(0xffF8F9FA),
                        image: DecorationImage(
                            image: NetworkImage(widget.item.img)),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                        color: Color(0xffF8F9FA),
                        image: DecorationImage(
                            image: NetworkImage(widget.item.img2)),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                        color: Color(0xffF8F9FA),
                        image: DecorationImage(
                            image: NetworkImage(widget.item.img3)),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text(
                  'Size',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    selectedIndex2 = 1;
                    setState(() {});
                  },
                  child: Text(
                    'EU ',
                    style: TextStyle(
                      fontSize: 18,
                      color: selectedIndex2 == 1
                          ? Colors.black
                          : Color(0xff707B81),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:  () {
                    selectedIndex2 = 2;
                    setState(() {});
                  },
                  child: Text(
                    ' US',
                    style: TextStyle(
                      fontSize: 18,
                      color:
                          selectedIndex2 == 2 ? Colors.black : Color(0xff707B81),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:  () {
                    selectedIndex2 = 3;
                    setState(() {});
                  },
                  child: Text(
                    ' UK',
                    style: TextStyle(fontSize: 18, 
                      color: 
                       selectedIndex2 == 3 ? Colors.black : Color(0xff707B81),
      
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => setState(() => selectedIndex = 0),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      '37',
                      style: TextStyle(
                          color: selectedIndex == 0
                              ? Color.fromARGB(255, 255, 255, 255)
                              : Color(0xff707B81)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: selectedIndex == 0
                        ? Color(0xff5B9EE1)
                        : Color(0xffF8F9FA),
                    boxShadow: selectedIndex == 0
                        ? [
                            BoxShadow(
                              color: Color(0xff5B9EE1).withOpacity(0.5),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ]
                        : [],
                  ),
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () => setState(() => selectedIndex = 1),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      '38',
                      style: TextStyle(
                          color: selectedIndex == 1
                              ? Color.fromARGB(255, 255, 255, 255)
                              : Color(0xff707B81)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: selectedIndex == 1
                        ? Color(0xff5B9EE1)
                        : Color(0xffF8F9FA),
                    boxShadow: selectedIndex == 1
                        ? [
                            BoxShadow(
                              color: Color(0xff5B9EE1).withOpacity(0.5),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ]
                        : [],
                  ),
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () => setState(() => selectedIndex = 2),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      '39',
                      style: TextStyle(
                          color: selectedIndex == 2
                              ? Color.fromARGB(255, 255, 255, 255)
                              : Color(0xff707B81)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: selectedIndex == 2
                        ? Color(0xff5B9EE1)
                        : Color(0xffF8F9FA),
                    boxShadow: selectedIndex == 2
                        ? [
                            BoxShadow(
                              color: Color(0xff5B9EE1).withOpacity(0.5),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ]
                        : [],
                  ),
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () => setState(() => selectedIndex = 3),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      '40',
                      style: TextStyle(
                          color: selectedIndex == 3
                              ? Color.fromARGB(255, 255, 255, 255)
                              : Color(0xff707B81)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: selectedIndex == 3
                        ? Color(0xff5B9EE1)
                        : Color(0xffF8F9FA),
                    boxShadow: selectedIndex == 3
                        ? [
                            BoxShadow(
                              color: Color(0xff5B9EE1).withOpacity(0.5),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ]
                        : [],
                  ),
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () => setState(() => selectedIndex = 4),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      '41',
                      style: TextStyle(
                          color: selectedIndex == 4
                              ? Color.fromARGB(255, 255, 255, 255)
                              : Color(0xff707B81)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: selectedIndex == 4
                        ? Color(0xff5B9EE1)
                        : Color(0xffF8F9FA),
                    boxShadow: selectedIndex == 4
                        ? [
                            BoxShadow(
                              color: Color(0xff5B9EE1).withOpacity(0.5),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ]
                        : [],
                  ),
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () => setState(() => selectedIndex = 5),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      '42',
                      style: TextStyle(
                          color: selectedIndex == 5
                              ? Color.fromARGB(255, 255, 255, 255)
                              : Color(0xff707B81)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: selectedIndex == 5
                        ? Color(0xff5B9EE1)
                        : Color(0xffF8F9FA),
                    boxShadow: selectedIndex == 5
                        ? [
                            BoxShadow(
                              color: Color(0xff5B9EE1).withOpacity(0.5),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ]
                        : [],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Row(
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff707B81),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${widget.item.Price}',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 99),
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<Cartcubit>(context).addItem(widget.item);
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                         return CartView();
                      }));
                    },
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5B9EE1),
                      fixedSize: Size(167, 54),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
