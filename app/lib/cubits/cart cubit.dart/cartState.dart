import 'package:app/models/item%20model.dart';

abstract class CartState {}
class InitalCartState extends CartState{}
class CardLoadedState extends CartState{
   final List<ItemModel> dataCart ;
  CardLoadedState(this.dataCart);
}