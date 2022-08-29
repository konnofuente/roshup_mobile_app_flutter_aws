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
    on<ClearLocalInfo>(_onClearLocalInfo);
    on<UpdateUsersName>(_onUpdateUserfirstName);
    on<UpdatePhoneNumber>(_onUpdatePhoneNumber);
    on<UpdateUserEmail>(_onUpdateUserEmail);
  }

  Future<FutureOr<void>> _onAddUser(
      AddUsers event, Emitter<UserState> emit) async {
    final state = this.state;
    emit(UserState(allUsers: List.from(state.allUsers)..add(event.users)));

    final item = User(
        id: event.users.id,
        firstName: event.users.firstName,
        phoneNumber: event.users.phoneNumber,
        email: event.users.email);

    try {
      await Amplify.DataStore.save(item);
      print('Succesfully save of user!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
    } catch (e) {
      print('OMline user not created: $e !!!!!!!!!!!');
    }
  }

  FutureOr<void> _onClearLocalInfo(
      ClearLocalInfo event, Emitter<UserState> emit) {
    final state = this.state;
    List<User> alluser = List.from(state.allUsers);
    alluser.clear();
    print("table user succefully cleared !!!!!!!!!!!!!");
  }

  Future<void> _onUpdateUserfirstName(
      UpdateUsersName event, Emitter<UserState> emit) async {
    final state = this.state;
    final firstName = event.firstName;
    final lastName = event.lastName;
    final user = event.users;
    final index = state.allUsers.indexOf(user);
    //update Locale storage
    List<User> alluser = List.from(state.allUsers)..remove(user);
    alluser.insert(
        index, user.copyWith(firstName: firstName, lastName: lastName));

    //update Cognito user information
    try {
      final result = await Amplify.Auth.updateUserAttribute(
        userAttributeKey: CognitoUserAttributeKey.name,
        value: '$firstName $lastName',
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

    //update User information in AWS User datastore Table
    try {
      final UserWithId = await Amplify.DataStore.query(
        User.classType,
        where: User.ID.eq(user.id),
      );
      final oldUser = UserWithId.first;
      final newUser = oldUser.copyWith(
          id: oldUser.id, firstName: firstName, lastName: lastName);
      await Amplify.DataStore.save(newUser);
    } catch (e) {
      print('Could not Save data in User Table $e ');
    }

    emit(UserState(allUsers: alluser));
  }

  Future<FutureOr<void>> _onUpdatePhoneNumber(
      UpdatePhoneNumber event, Emitter<UserState> emit) async {
    final state = this.state;
    final phoneNumber = event.phoneNumber;
    final user = event.users;
    final index = state.allUsers.indexOf(user);
    List<User> alluser = List.from(state.allUsers)..remove(user);
    alluser.insert(index, user.copyWith(phoneNumber: phoneNumber));

    try {
      final result = await Amplify.Auth.updateUserAttribute(
        userAttributeKey: CognitoUserAttributeKey.phoneNumber,
        value: phoneNumber,
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
                builder: (context) =>
                    UserVerification(phno: event.users.phoneNumber)));
      } else {
        print('Update completed');
      }
    } on AmplifyException catch (e) {
      print(e.message);
    }

    emit(UserState(allUsers: alluser));
  }
}
