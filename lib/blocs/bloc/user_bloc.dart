import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/User.dart';
import 'user_state.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<AddUsers>(_onAddUser);
    on<UpdateUsers>(_onUpdateUser);
  }

  Future<FutureOr<void>> _onAddUser(AddUsers event, Emitter<UserState> emit) async {
    final state = this.state;
     emit(UserState(
        allUsers: List.from(state.allUsers)..add(event.users)));

      final item = User(
      id: event.users.id,
		  name: event.users.name,
		  phone_number: event.users.phone_number,
		  email: event.users.email,
		  image: event.users.image);

      try {
    await Amplify.DataStore.save(item);
      print('Succesfully save of user!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
    } catch (e) {
      print('OMline user not created: $e !!!!!!!!!!!');
    }
  }

  FutureOr<void> _onUpdateUser(UpdateUsers event, Emitter<UserState> emit) {}
}
