import 'package:flutter_bloc/flutter_bloc.dart';

class CartTotalCubit extends Cubit<double> {
  CartTotalCubit() : super(0);

  void updateTotal(double total) {
    emit(total);
  }
}