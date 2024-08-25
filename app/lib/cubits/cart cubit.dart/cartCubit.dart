import 'package:app/cubits/cart%20cubit.dart/cartState.dart';
import 'package:app/models/item%20model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cartcubit extends Cubit<CartState> {
  Cartcubit() : super(InitalCartState());
  List<ItemModel> cartItems = [];

  void removeItem(int index) {
    cartItems.removeAt(index);
    emit(CardLoadedState(List.from(cartItems)));
  }
  void addItem(ItemModel item) {
    cartItems.add(item);
    emit(CardLoadedState(List.from(cartItems))); 
  }
}
