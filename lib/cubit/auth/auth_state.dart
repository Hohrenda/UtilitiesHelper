import 'package:flutter/cupertino.dart';
import 'package:utilities_helper/models/user_model.dart';

@immutable
class AuthState{

  final UserModel currentUser;
  final bool isLoading;

  AuthState({
    this.currentUser,
    this.isLoading = false,
});

  AuthState copyWith({
  UserModel currentUser,
    bool isLoading
}){
    return AuthState(
      currentUser: currentUser?? this.currentUser,
      isLoading: isLoading ?? this.isLoading,
    );
  }

}