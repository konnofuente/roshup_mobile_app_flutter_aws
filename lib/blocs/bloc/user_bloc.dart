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
    on<UpdateUsersName>(_onUpdateUserName);
  }

  Future<FutureOr<void>> _onAddUser(
      AddUsers event, Emitter<UserState> emit) async {
    final state = this.state;
    emit(UserState(allUsers: List.from(state.allUsers)..add(event.users)));

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

  // Future<FutureOr<void>> _onUpdateUserName(UpdateUsersName event, Emitter<UserState> emit) async {
  //    final state = this.state;
  //   final user = event.users;
  //   final index = state.allUsers.indexOf(user);
  //   List<User> alluser = List.from(state.allUsers)..remove(user);
  //   alluser.insert(
  //       index,
  //       user.copyWith(name: event.users.name));

  //   try {
  //   final result = await Amplify.Auth.updateUserAttribute(
  //     userAttributeKey: CognitoUserAttributeKey.name,
  //     value: event.users.name!,
  //   );
  //   if (result.nextStep.updateAttributeStep == 'CONFIRM_ATTRIBUTE_WITH_CODE') {
  //     var destination = result.nextStep.codeDeliveryDetails?.destination;
  //     print('Confirmation code sent to $destination');
  //   } else {
  //     print('Update completed');
  //   }
  // } on AmplifyException catch (e) {
  //   print(e.message);
  // }

  // }

  Future<FutureOr<void>> _onUpdateUserName(
      UpdateUsersName event, Emitter<UserState> emit) async {
    final state = this.state;
    final name = event.name;
    final user = event.users;
    final index = state.allUsers.indexOf(user);
    List<User> alluser = List.from(state.allUsers)..remove(user);
    alluser.insert(index, user.copyWith(name: name));

    try {
      final result = await Amplify.Auth.updateUserAttribute(
        userAttributeKey: CognitoUserAttributeKey.name,
        value: name,
      );
      if (result.nextStep.updateAttributeStep ==
          'CONFIRM_ATTRIBUTE_WITH_CODE') {
        var destination = result.nextStep.codeDeliveryDetails?.destination;
        print('Confirmation code sent to $destination');
      } else {
        print('Update completed');
      }
    } on AmplifyException catch (e) {
      print(e.message);
    }

       emit(UserState(
      allUsers:alluser
      ));
  }

     
}
