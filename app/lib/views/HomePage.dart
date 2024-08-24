import 'package:app/Parts/new%20Arrivals%20item.dart';
import 'package:app/Parts/new%20arrivals%20container.dart';
import 'package:app/Parts/brands%20icon%20Scroll.dart';
import 'package:app/Parts/popular%20item.dart';
import 'package:app/Parts/search.dart';
import 'package:app/Service/builderItem.dart';
import 'package:app/Service/builderitem2.dart';
import 'package:app/core/utlis/size%20config%20model.dart';
import 'package:app/views/test.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
     int _selectedIndex = 0;

    final suggestions = [
    'Nike',
    'Puma',
    'Under ARMOUR',
    'Adidas',
    'Convers'
    ];

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.account_circle_outlined, size: 30, color: Color.fromARGB(255, 84, 84, 84)),
          Icon(Icons.favorite_outline, size: 30, color: Color.fromARGB(255, 84, 84, 84)),
          Icon(Icons.shopping_cart_outlined, size: 30, color: Color.fromARGB(255, 115, 192, 255)),
          Icon(Icons.notifications_outlined, size: 30, color: Color.fromARGB(255, 84, 84, 84)),
          Icon(Icons.home_outlined, size: 30, color: Color.fromARGB(255, 84, 84, 84)),
        ],
        color: const Color(0xfff8f9fb),
        buttonBackgroundColor:const Color(0xfff8f9fb),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      backgroundColor: const Color(0xfff8f9fb),
      appBar: AppBar(
        backgroundColor: const Color(0xfff8f9fb),
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceB,
            children: [
              SizedBox(
                height: 45,
                child: Image.asset('assets/Icon.png'),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Store location',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff707B81),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                        child: Image.asset('assets/location.png'),
                      ),
                      const Text(
                        ' Mondolibug, Sylhet',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff1A2530),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                height: 45,
                child: Image.asset('assets/Group 27.png'),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
           const SliverToBoxAdapter(
           child:  SearchContainer(),
           ),
           SliverToBoxAdapter(
            child: SizedBox(
              height: SizeConfig.defaultSize! * 3,
            ) ,
           ),
           const SliverToBoxAdapter(
            child: BrandsIcon(),
           ),
           const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular Shoes' ,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ), 
                  ),
                  Text('See all' , 
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  ),
                ],
              ),
            ),
           ),
          const SliverToBoxAdapter(
            child:Builderitem(),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('New Arrivals' ,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ), 
                  ),
                  Text('See all' , 
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  ),
                ],
              ),
            ),
           ),
          const SliverToBoxAdapter(
            child: Builderitem2(),
          )
        ],
      ),
    );
  }
}
