import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  bool _isSignUp = true;

  String _userName = "";
  String _userEmail = "";
  String _userPassword = "";

  void tryValidation() {
    if (_isSignUp) {
      if (_signUpFormKey.currentState!.validate()) {
        _signUpFormKey.currentState!.save();
      }
    }
    if (!_isSignUp) {
      if (_signInFormKey.currentState!.validate()) {
        _signInFormKey.currentState!.save();
      }
    }
  }

  GlobalKey<FormState> get signInFormKey => _signInFormKey;

  GlobalKey<FormState> get signUpFormKey => _signUpFormKey;

  bool get isSignUp => _isSignUp;

  String get userName => _userName;

  String get userEmail => _userEmail;

  String get userPassword => _userPassword;

  set userPassword(String value) {
    _userPassword = value;
  }

  set userEmail(String value) {
    _userEmail = value;
  }

  set userName(String value) {
    _userName = value;
  }

  set isSignUp(bool value) {
    _isSignUp = value;
    notifyListeners();
  }

}
