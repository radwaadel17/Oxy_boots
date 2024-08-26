import 'package:app/Parts/itemCart.dart';
import 'package:app/Service/getData.dart';
import 'package:app/cubits/cart%20cubit.dart/cartCubit.dart';
import 'package:app/cubits/cart%20cubit.dart/cartState.dart';
import 'package:app/cubits/total%20sum%20cubit/states.dart';
import 'package:app/cubits/total%20sum%20cubit/sumCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  double total = 0;
  bool ch = false;
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
                        return ItemCart(
                          item: state.dataCart[index],
                          onremove: () {
                            BlocProvider.of<Cartcubit>(context)
                                .removeItem(index);
                            BlocProvider.of<CartTotalCubit>(context)
                                .removeItem(index);
                          },
                          itemIndex: index,
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 38, vertical: 5),
                  child: Row(
                    children: [
                      const Text(
                        'Subtotal',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xff707B81),
                        ),
                      ),
                      BlocBuilder<CartTotalCubit, MainState>(
                        builder: (context, state) {
                          if(state is SumState){
                           return Padding(
                            padding: const EdgeInsets.only(left: 126),
                            child: Text(
                              '\$${state.result.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          );
                          }
                          else {
                            return const Padding(
                            padding: EdgeInsets.only(left: 126),
                            child: Text(
                              '\$0.0',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          );
                          }
                        
                        },
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 38, vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        'Shopping',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xff707B81)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 117),
                        child: Text(
                          '\$40',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Divider(
                  color:
                      const Color.fromARGB(255, 188, 188, 188).withOpacity(0.8),
                  height: 1,
                  thickness: 1,
                  indent: 40,
                  endIndent: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 38, vertical: 5),
                  child: Row(
                    children: [
                      const Text(
                        'ToTal Cost',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      BlocBuilder<CartTotalCubit, MainState>(
                        builder: (context, state) {
                          if (state is SumState) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 110),
                              child: Text(
                                '\$${(state.result + 40).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          } else {
                            return const Padding(
                              padding: EdgeInsets.only(left: 110),
                              child: Text(
                                '\$0.0',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(335, 54),
                    backgroundColor: Color(0xff5B9EE1),
                  ),
                  child: ch == false
                      ? const Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Payment',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                ),
                const SizedBox(
                  height: 15,
                ),
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
