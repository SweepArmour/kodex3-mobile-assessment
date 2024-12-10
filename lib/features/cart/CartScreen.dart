import 'package:es_guard/Providers/CartProvider.dart';
import 'package:es_guard/core/models/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {

    final cartProvider = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(
         title: Text("Cart"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Text("Cart(${cartProvider.productList.length})",style: Theme.of(context).textTheme.headlineMedium,),

              cartProvider.productList.isEmpty?

                  Column(
                    children: [Text("No item found in cart")],
                  )
                  : ListView.builder(
                   physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartProvider.productList.length, itemBuilder: (_, i){
                return CartItem(data: cartProvider.productList[i]);
              })
            ],
          ),
        ),
      ),

    );
  }
}


class CartItem extends StatelessWidget {
  const CartItem({super.key,required this.data});
   final ProductModel data;


  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.grey)),
      child: Column(
        children: [
          Image.network(
            data.imgUrl!,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.productName!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text(
                    "N${data.price}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.w600),
                  ),
                  FilledButton(onPressed: () {
                    cartProvider.removeProduct = data;
                  }, child: Text("Remove from cart"))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

