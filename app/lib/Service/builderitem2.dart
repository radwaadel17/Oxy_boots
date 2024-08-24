import 'package:app/Parts/new%20Arrivals%20item.dart';
import 'package:app/Parts/popular%20item.dart';
import 'package:app/Service/getData.dart';
import 'package:app/models/item%20model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Builderitem2 extends StatefulWidget {
  const Builderitem2({super.key});

  @override
  State<Builderitem2> createState() => _Builderitem2State();
}

class _Builderitem2State extends State<Builderitem2> {
  var FutureData ;
  @override
  void initState() {
    super.initState();
    FutureData = requestData(Dio()).getDatafromApi2();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ItemModel>>(
      future: FutureData,
       builder: (context , snapshot){
          if(snapshot.hasData){
             return NewArrivalsItem(ListModel: snapshot.data!);
          }
          else if(snapshot.hasError){
            return Center(child: Text('There was an error'),);
          }
          else {
           return 
                 Center(child: CircularProgressIndicator());
          }
       });
  }
}