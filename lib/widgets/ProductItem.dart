import 'package:es_guard/Providers/CartProvider.dart';
import 'package:es_guard/core/models/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.data});

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
                     cartProvider.addProduct = data;
                  }, child: Text("+ cart"))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
