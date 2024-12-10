import 'package:es_guard/core/constants/ConstantsData.dart';
import 'package:es_guard/features/articles/articlesScreen.dart';
import 'package:es_guard/features/cart/CartScreen.dart';
import 'package:es_guard/features/counterApp/CounterApp.dart';
import 'package:es_guard/features/home/home.dart';
import 'package:es_guard/features/wishlist/WishListScreen.dart';
import 'package:flutter/material.dart';

class RouterGenerator{
  static  Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case ConstantsData.home:
        return MaterialPageRoute(builder: (context){
          return HomeScreen();
        });
      case ConstantsData.cart:
        return MaterialPageRoute(builder: (context){
          return CartScreen();
        });

      case ConstantsData.wishlist:
        return MaterialPageRoute(builder: (_){
          return WishlistScreen();
        });

      case ConstantsData.counter:
        return MaterialPageRoute(builder: (_){
          return CounterApp();
        });

      case ConstantsData.articles:
        return MaterialPageRoute(builder: (_){
          return ArticlesScreen();
        });

      default:
        return MaterialPageRoute(builder: (_){
           return Scaffold(
             body: Center(
               child: Text("Error page"),
             ),
           );
        });
    }
  }
}