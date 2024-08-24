import 'package:app/models/item%20model.dart';

abstract class FavState{} 
class  FavInitial extends FavState{}
class FavLoaded extends FavState {
  final List<ItemModel> favs;
  FavLoaded(this.favs);
}