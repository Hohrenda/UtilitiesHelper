import 'package:meta/meta.dart';
import 'package:utilities_helper/models/user_model.dart';

@immutable
class MessagesState {
  final List<UserModel> allUsers;
  final bool isLoading;

  MessagesState({
    this.allUsers = const [],
    this.isLoading = true,
  });

  MessagesState copyWith({
    List<UserModel> allUsers,
    bool isLoading,
  }) {
    if ((allUsers == null || identical(allUsers, this.allUsers)) &&
        (isLoading == null || identical(isLoading, this.isLoading))) {
      return this;
    }
    return new MessagesState(
      allUsers: allUsers ?? this.allUsers,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}