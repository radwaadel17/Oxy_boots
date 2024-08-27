import 'package:app/Parts/item%20container.dart';
import 'package:app/Parts/new%20arrivals%20container.dart';
import 'package:app/models/item%20model.dart';
import 'package:app/views/see%20all%20best%20Seller.dart';
import 'package:flutter/material.dart';

class NewArrivalsItem extends StatelessWidget {
  const NewArrivalsItem({super.key , required this.ListModel});
  final List<ItemModel> ListModel ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New Arrivals',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SeeAll(models: ListModel);
                    }));
                  },
                  child: Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        SizedBox(
          height: 160,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ListModel.length,
              itemBuilder: (context, cnt) {
                return NewArrivalscontainer(item: ListModel[cnt]);
              },
            ),
          ),
        ),
      ],
    );
  }
}

