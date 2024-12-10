import 'package:es_guard/Providers/AuthProvider.dart';
import 'package:es_guard/Providers/CounterProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {


  TextEditingController _emailCtrl = TextEditingController(text: "oekchukwuOmeh@gm.com");
  TextEditingController _phoneCtrl = TextEditingController(text: "08115451846");

  @override
  Widget build(BuildContext context) {
    // final countProvider = Provider.of(context, listen: false);
    final countProvider = context.watch<CounterProvider>();
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter screen"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Value: ${countProvider.count} ",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                      onPressed: () {
                        countProvider.increment();
                      },
                      child: Text("Add")),
                  const SizedBox(
                    width: 12,
                  ),
                  FilledButton(
                      onPressed: () {
                        countProvider.decrement();
                      },
                      child: Text("Subtract")),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                child: Column(
                  children: [
                    Text("Email: ${authProvider.authData.email}"),
                    Text("Phone number: ${authProvider.authData.phone}"),
                  ],
                ),
              ),
              TextFormField(
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration( hintText: "Email"),
                onChanged: (v){
                  authProvider.changeEmail(v);
                },
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _phoneCtrl,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: "Phone"),
                onChanged: (v){
                  authProvider.changeP = v;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
