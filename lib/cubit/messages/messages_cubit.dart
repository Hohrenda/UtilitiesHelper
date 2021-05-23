import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utilities_helper/cubit/messages/messages_state.dart';
import 'package:utilities_helper/service/messages_service.dart';
import 'package:utilities_helper/service/user_service.dart';

class MessagesCubit extends Cubit<MessagesState> {
  final _userService = UserService();
  final _messagesService = MessagesService();
  StreamSubscription allUsersSubscription;

  MessagesCubit() : super(MessagesState());

  Future<void> loadInitialData() async {
    try {
      emit(state.copyWith(isLoading: true));
      allUsersSubscription = _userService.allUsersStream().listen((users) {
        emit(state.copyWith(allUsers: users, isLoading: false));
      });
    } catch (e, s) {
      emit(state.copyWith(isLoading: false));
    }
  }

  void dispose() {
    allUsersSubscription.cancel();
  }
}