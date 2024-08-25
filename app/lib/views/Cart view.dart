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
       
        backgroundColor: const Color(0xfff8f9fb),
        title: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: const Center(
              child: Text(
            'My Cart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
      body: BlocBuilder<Cartcubit, CartState>(
        builder: (context, state) {
          if (state is CardLoadedState) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: state.dataCart.length,
                      itemBuilder: (context, index) {
                        return ItemCart(item: state.dataCart[index] ,
                        onremove: (){
                          BlocProvider.of<Cartcubit>(context).removeItem(index);
                         },
                        );
                      }),
                ),
                ElevatedButton(onPressed: (){} 
                , child: Text('checkout' , 
                style: TextStyle(
                  fontSize: 18 , 
                  color: Colors.white,
                ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(335, 54),
                  backgroundColor: Color(0xff5B9EE1),
                ),
                ),
                SizedBox(height: 30,),
              ],
            );
          } else {
            return const Center(child: Text('No items added yet.'));
          }
        }, 
      ),
    );
  }
}
