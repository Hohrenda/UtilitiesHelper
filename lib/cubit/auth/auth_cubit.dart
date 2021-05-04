import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utilities_helper/service/auth_service.dart';
import 'package:utilities_helper/cubit/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  final _authService = AuthService();

  AuthCubit() : super(AuthState());

  Future<void> checkCurrentUser() async {
    try{
      emit(state.copyWith(isLoading: true));
      final currentUser = await _authService.checkCurrentUser();
      emit(state.copyWith(currentUser: currentUser,isLoading: false));


    }
    catch(e){
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> googleSignIn() async{
    try{
      emit(state.copyWith(isLoading: true));
      final response = await _authService.googleSignIn();
      emit(state.copyWith(currentUser: response,isLoading: false));
    }
    catch(e){
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> facebookSignIn() async {
    try{
      emit(state.copyWith(isLoading: true));
      final response = await _authService.facebookLogin();
      emit(state.copyWith(currentUser: response,isLoading: false));
    }
    catch(e){
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> logOut() async {
    try{
      emit(state.copyWith(isLoading: true));
      await _authService.logout();
      emit(state.copyWith(isLoading: false));
    }catch(e){
      emit(state.copyWith(isLoading: false));
    }

  }

}