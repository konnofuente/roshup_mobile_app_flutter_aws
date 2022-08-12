import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/User.dart';
import '../../screens/Login/UserVerification.dart';
import 'user_state.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<AddUsers>(_onAddUser);
    on<UpdateUsersName>(_onUpdateUserName);
    on<UpdatePhoneNumber>(_onUpdatePhoneNumber);
    on<UpdateUserEmail>(_onUpdateUserEmail);
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

  Future<void> _onUpdateUserName(
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

    emit(UserState(allUsers: alluser));
  }

  Future<FutureOr<void>> _onUpdatePhoneNumber(
      UpdatePhoneNumber event, Emitter<UserState> emit) async {
    final state = this.state;
    final phone_number = event.phone_number;
    final user = event.users;
    final index = state.allUsers.indexOf(user);
    List<User> alluser = List.from(state.allUsers)..remove(user);
    alluser.insert(index, user.copyWith(phone_number: phone_number));

    try {
      final result = await Amplify.Auth.updateUserAttribute(
        userAttributeKey: CognitoUserAttributeKey.phoneNumber,
        value: phone_number,
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

    emit(UserState(allUsers: alluser));
  }

  Future<FutureOr<void>> _onUpdateUserEmail(
      UpdateUserEmail event, Emitter<UserState> emit) async {
    final state = this.state;
    final email = event.email;
    final user = event.users;
    final context = event.context;
    final index = state.allUsers.indexOf(user);
    List<User> alluser = List.from(state.allUsers)..remove(user);
    alluser.insert(index, user.copyWith(email: email));

    try {
      final result = await Amplify.Auth.updateUserAttribute(
        userAttributeKey: CognitoUserAttributeKey.email,
        value: email,
      );
      if (result.nextStep.updateAttributeStep ==
          'CONFIRM_ATTRIBUTE_WITH_CODE') {
        var destination = result.nextStep.codeDeliveryDetails?.destination;
        print('Confirmation code sent to $destination');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserVerification(phno: event.users.phone_number)));
      } else {
        print('Update completed');
      }
    } on AmplifyException catch (e) {
      print(e.message);
    }

    emit(UserState(allUsers: alluser));
  }
}
