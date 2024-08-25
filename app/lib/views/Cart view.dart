import 'package:app/Parts/itemCart.dart';
import 'package:app/Service/getData.dart';
import 'package:app/cubits/cart%20cubit.dart/cartCubit.dart';
import 'package:app/cubits/cart%20cubit.dart/cartState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: const Color(0xfff8f9fb),
      appBar: AppBar(
        leadingWidth: 2,
        backgroundColor: const Color(0xfff8f9fb),
        title: const Center(
            child: Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      body: BlocBuilder<Cartcubit, CartState>(
        builder: (context, state) {
          if (state is CardLoadedState) {
            return ListView.builder(
                itemCount: state.dataCart.length,
                itemBuilder: (context, index) {
                  return ItemCart(item: state.dataCart[index] ,
                  onremove: (){
                    BlocProvider.of<Cartcubit>(context).removeItem(index);
                   },
                  );
                });
          } else {
            return const Center(child: Text('No favorites added yet.'));
          }
        }, 
      ),
    );
  }
}
