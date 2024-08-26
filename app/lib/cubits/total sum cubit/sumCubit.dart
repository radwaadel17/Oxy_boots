import 'package:app/cubits/total%20sum%20cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  CartTotalCubit  extends Cubit<MainState>{
 CartTotalCubit() :super(InitailState());
  Map<int , double > total = {0:0};
  double sum = 0 ;
 void calc (){
    sum = 0 ;
  total.forEach((key , value) {
   sum+=value;
  });
  emit(SumState(sum));
 }
 void removeItem (int index){
   sum -= total[index]!;
   total.remove(index);
   calc();
   emit(SumState(sum));
 }
 void add (double number , int index){
  total[index]  = number ;
  calc();
 }

}