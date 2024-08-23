import 'package:flutter/material.dart';



class PageControllerExample extends StatefulWidget {
  @override
  _PageControllerExampleState createState() => _PageControllerExampleState();
}

class _PageControllerExampleState extends State<PageControllerExample> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Controller Example'),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Center(child: Text('Page 1')),
          Center(child: Text('Page 2')),
          Center(child: Text('Page 3')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextPage,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}