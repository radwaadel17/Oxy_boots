import 'package:app/cubits/favourite%20cubit/favStates.dart';
import 'package:app/models/item%20model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<FavState>{
  FavouriteCubit() :super(FavInitial());
  final List<ItemModel> _favorites = [];
  void addFav(ItemModel item){
   _favorites.add(item);
   emit(FavLoaded(List.from(_favorites)));
  }
}