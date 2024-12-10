import 'package:es_guard/Providers/AuthProvider.dart';
import 'package:es_guard/core/constants/ConstantsData.dart';
import 'package:es_guard/core/models/ProductModel.dart';
import 'package:es_guard/widgets/ProductItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/CartProvider.dart';
import '../../Providers/CounterProvider.dart';

//parent widget

//Stateful
//parent -> createState
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

///State ->build

class _HomeScreenState extends State<HomeScreen> {



  List<ProductModel> allProducts = [
    ProductModel(
      id: "1324425132341",
      productName: "Koi Koi shoe",
      price: 11000.45,
      imgUrl:
      "https://images.pexels.com/photos/336372/pexels-photo-336372.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    ProductModel(
      id: "1324425sfsf2341",
      productName: "Blue shoe",
      price: 12000.45,
      imgUrl:
      "https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    ProductModel(
      id: "1324425132qsafjks",
      productName: "Rebok shoe",
      price: 34000.45,
      imgUrl:
      "https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    )
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu)),
        centerTitle: false,
        title: const Text("Kodex3 cart"),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ConstantsData.cart);
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.grey[600],
                  )),
              cartProvider.productList.isNotEmpty
                  ? Positioned(
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(300)),
                        child: Text(
                          "${cartProvider.productList.length}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ))
                  : const SizedBox()
            ],
          ),

          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ConstantsData.counter);
              },
              icon: Icon(
                Icons.plus_one,
                color: Colors.grey[600],
              )),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ConstantsData.articles);
              },
              icon: Icon(
                Icons.book,
                color: Colors.grey[600],
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: allProducts.map((e){
              return ProductItem(data: e);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
