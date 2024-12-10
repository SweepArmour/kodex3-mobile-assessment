import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthModel _authData = AuthModel(email: "", phone: "");

  AuthModel get authData=>_authData;

  changePhone(String v){
    _authData.phone = v;
    notifyListeners();
  }

  void set changeP(String v){
     _authData.phone = v;
     notifyListeners();
  }

  changeEmail(String v){
    _authData.email = v;
    notifyListeners();
  }

}

class AuthModel {
  AuthModel({this.email, this.phone});
  String? email;
  String? phone;
}
