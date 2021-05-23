import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utilities_helper/cubit/messages/messages_cubit.dart';
import 'package:utilities_helper/cubit/messages/messages_state.dart';
import 'package:utilities_helper/utils/widget_utils.dart';
import 'package:utilities_helper/cutom_widgets/user_avatar.dart';

class MessagesTab extends StatefulWidget {
  @override
  _MessagesTabState createState() => _MessagesTabState();
}

class _MessagesTabState extends State<MessagesTab> {
  final messagesCubit = MessagesCubit();

  @override
  void initState() {
    messagesCubit.loadInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesCubit, MessagesState>(
      bloc: messagesCubit,
      builder: (_, state) {
        if (state.isLoading) return WidgetUtils.showLoading();
        if (state.allUsers.isEmpty) return Text('No users found');
        return ListView.builder(
          itemCount: state.allUsers.length,
          itemBuilder: (_, index) {
            final user = state.allUsers[index];
            return ListTile(
              leading: UserAvatar(user: user),
              title: Text(user.name),
              trailing: Icon(Icons.message, color: Colors.blueGrey),
              onTap: () {},
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    messagesCubit.dispose();
    super.dispose();
  }
}