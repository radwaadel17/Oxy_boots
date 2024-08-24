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
}

List<ItemModel> getItemLitst(List<dynamic> json) {
  List<ItemModel> list = [];
  for (int i = 0; i < json.length; i++) {
    list.add(ItemModel.fromjson(json[i]));
  }
  return list;
}
