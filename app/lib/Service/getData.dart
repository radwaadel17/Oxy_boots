import 'package:app/models/item%20model.dart';
import 'package:dio/dio.dart';

class requestData {
  final Dio dio;
  requestData(this.dio);
  Future<List<ItemModel>> getData() async {
    try{
    Response response =
    await dio.get('https://dummyjson.com/products/category/mens-shoes');
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> jsonDataList = jsonData['products'];
    List<ItemModel> dataList = getItemLitst(jsonDataList);
    return dataList;
    }catch(e){
      print(e.toString());
      return[];
    }
  }
   Future<List<ItemModel>> getDatafromApi2() async {
    try{
    Response response =
    await dio.get("https://fakestoreapi.com/products");
    List<dynamic> jsonData = response.data;
    List<ItemModel> dataList = getItemLitst2(jsonData);
    return dataList;
    }catch(e){
      print(e);
      return[];
    }
  }
}

List<ItemModel> getItemLitst(List<dynamic> json) {
  List<ItemModel> list = [];
  for (int i = 0; i < json.length; i++) {
    list.add(ItemModel.fromjson(json[i]));
  }
  return list;
}
List<ItemModel> getItemLitst2(List<dynamic> json) {
  List<ItemModel> list = [];
  for (int i = 0; i < json.length; i++) {
    list.add(ItemModel.fromjsonapi2(json[i]));
  }
  return list;
}
