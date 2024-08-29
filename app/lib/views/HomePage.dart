import 'dart:io';

import 'package:app/Parts/new%20Arrivals%20item.dart';
import 'package:app/Parts/new%20arrivals%20container.dart';
import 'package:app/Parts/brands%20icon%20Scroll.dart';
import 'package:app/Parts/popular%20item.dart';
import 'package:app/Parts/search.dart';
import 'package:app/Service/builderItem.dart';
import 'package:app/Service/builderitem2.dart';
import 'package:app/core/utlis/size%20config%20model.dart';
import 'package:app/cubits/favourite%20cubit/favCubit.dart';
import 'package:app/views/Account%20view.dart';
import 'package:app/views/Cart%20view.dart';
import 'package:app/views/Favorite.dart';
import 'package:app/views/Notify%20view.dart';
import 'package:app/views/Sign%20in.dart';
import 'package:app/views/test.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:searchfield/searchfield.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;
  String name ='none';
  File? _imageFile ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserData();

  }
  
  final List<Widget> pages = [
    Account(),
    FavoriteView(),
    homepagebody(),
    CartView(),
    NotifyView(),
  ];
 
  @override
  
   Future<void> _loadUserData() async {
   
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'Not set';
      String? imagePath = prefs.getString('profile_image_path');
      if (imagePath != null) {
      _imageFile = File(imagePath);
    }
    });
    }
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          backgroundColor: Color(0xff1A2530),
          shape: LinearBorder(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align items to the start
                  children: [
                    // User info
                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align items to the start
                      children: [
                        ClipOval(
                          child: Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: _imageFile!=null ? Image.file(_imageFile! , fit: BoxFit.cover,) : Image.asset('assets/side bar icons/user.png' , fit: BoxFit.cover),
                          ),
                          
                        ),
                        SizedBox(
                            width:
                                10), // Add some space between the container and text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align text to the start
                          children: [
                            Text(
                              'Hey, 👋',
                              style: TextStyle(
                                color: Color(0xff707B81),
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Sidebar items
                    itemsSideBar(
                      img: 'assets/side bar icons/user.png',
                      txt: 'Profile',
                      onTap: () {
                        Navigator.pushNamed(context, 'prof');
                      },
                    ),
                    itemsSideBar(
                      img: 'assets/side bar icons/home.png',
                      txt: 'Home Page',
                      onTap: (){
                       Navigator.pushNamed(context, 'hm');
                      },
                    ),
                    itemsSideBar(
                      img: 'assets/side bar icons/Frame.png',
                      txt: 'My Cart',
                      onTap: (){
                        Navigator.pushNamed(context, 'cart');
                      },
                    ),
                    itemsSideBar(
                      img: 'assets/side bar icons/Group.png',
                      txt: 'Favourite',
                      onTap: (){
                        Navigator.pushNamed(context, 'fav');
                      },
                    ),
                    itemsSideBar(
                      img: 'assets/side bar icons/Fats Delivery.png',
                      txt: 'Orders',
                      onTap:() {
                        
                      } ,
                    ),
                    itemsSideBar(
                      img: 'assets/side bar icons/Notifications.png',
                      txt: 'Notifications',
                      onTap: () {
                        Navigator.pushNamed(context, 'not');
                      },
                    ),
                    Divider(
                      indent: 35,
                      endIndent: 35,
                      color: Color(0xff2D3B48),
                    ),
                    itemsSideBar(
                      img: 'assets/side bar icons/Sign Out (1).png',
                      txt: 'Sign Out',
                      onTap: () {
                      Navigator.pushNamed(context, 'signin');

                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.account_circle_outlined,
              size: 30, color: Color.fromARGB(255, 84, 84, 84)),
          Icon(Icons.favorite_outline,
              size: 30, color: Color.fromARGB(255, 84, 84, 84)),
          Icon(Icons.home_outlined,
              size: 30, color: Color.fromARGB(255, 115, 192, 255)),
          Icon(Icons.shopping_cart_outlined,
              size: 30, color: Color.fromARGB(255, 84, 84, 84)),
          Icon(Icons.notifications_outlined,
              size: 30, color: Color.fromARGB(255, 84, 84, 84)),
        ],
        color: const Color(0xfff8f9fb),
        buttonBackgroundColor: const Color(0xfff8f9fb),
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
                child: Builder(builder: (context) {
                  return GestureDetector(
                      onTap: () {
                        //Navigator.pushNamed(context, 'sd');
                        Scaffold.of(context).openDrawer();
                      },
                      child: Image.asset('assets/Icon.png'));
                }),
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
                child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, PageTransition(child: CartView(), type: PageTransitionType.bottomToTop));
                    },
                    child: Image.asset('assets/Group 27.png')),
              ),
            ],
          ),
        ),
      ),
      body: pages[_selectedIndex],
    );
  }
}

class itemsSideBar extends StatelessWidget {
  const itemsSideBar({
    super.key,
    required this.img,
    required this.txt,
    required this.onTap
  });
  final String img;
  final String txt;
  final VoidCallback onTap ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Row(
        children: [
          SizedBox(height: 25, child: Image.asset(img)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              txt,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class homepagebody extends StatelessWidget {
  const homepagebody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SearchContainer(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: SizeConfig.defaultSize! * 3,
          ),
        ),
        const SliverToBoxAdapter(
          child: BrandsIcon(),
        ),
        const SliverToBoxAdapter(
          child: Builderitem(),
        ),
        const SliverToBoxAdapter(
          child: Builderitem2(),
        )
      ],
    );
  }
}
