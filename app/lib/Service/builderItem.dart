import 'package:app/Parts/popular%20item.dart';
import 'package:app/Service/getData.dart';
import 'package:app/models/item%20model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Builderitem extends StatefulWidget {
  const Builderitem({super.key});

  @override
  State<Builderitem> createState() => _BuilderitemState();
}

class _BuilderitemState extends State<Builderitem> {
  var FutureData ;
  @override
  void initState() {
    super.initState();
    FutureData = requestData(Dio()).getData();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ItemModel>>(
      future: FutureData,
       builder: (context , snapshot){
          if(snapshot.hasData){
             return PopularItem(ListModel: snapshot.data!);
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