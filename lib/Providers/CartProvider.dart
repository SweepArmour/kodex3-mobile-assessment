import 'package:flutter/material.dart';

import '../core/models/ProductModel.dart';

class CartProvider extends ChangeNotifier{
   List<ProductModel> _productList = [];

   List<ProductModel> get productList =>_productList;

    set addProduct(ProductModel v){
     _productList.add(v);
     notifyListeners();
   }
    set removeProduct(ProductModel v){
     int currentIndex = _productList.indexWhere((e)=>e.id==v.id);
     _productList.removeAt(currentIndex);
     notifyListeners();
   }
}