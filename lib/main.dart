import 'package:es_guard/Providers/AuthProvider.dart';
import 'package:es_guard/Providers/CartProvider.dart';
import 'package:es_guard/Providers/CounterProvider.dart';
import 'package:es_guard/config/routes/router.dart';
import 'package:es_guard/core/constants/ConstantsData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
   runApp(
     MultiProvider(
       providers: [
       ChangeNotifierProvider(create: (_)=>AuthProvider()),
       ChangeNotifierProvider(create: (_)=>CounterProvider()),
       ChangeNotifierProvider(create: (_)=>CartProvider()),
     ],
     child: const ShoppingApp(),)
   );
}

class ShoppingApp extends StatelessWidget{
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ConstantsData.home,
      onGenerateRoute: (RouteSettings rc) {
        return RouterGenerator.generateRoute(rc);
      }
      ,
    );
  }
}



