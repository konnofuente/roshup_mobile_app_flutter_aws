part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class AddUsers extends UserEvent {
  final User users;
  const AddUsers({
    required this.users,
  });
  @override
  List<Object> get props => [users];
}

class ClearLocalInfo extends UserEvent {
  const ClearLocalInfo();
}

class UpdateUsersName extends UserEvent {
  final String firstName;
  final String lastName;
  final User users;
  const UpdateUsersName({
    required this.firstName,
    required this.lastName,
    required this.users,
  });
  @override
  List<Object> get props => [
        {firstName,lastName, users}
      ];
}

class UpdatePhoneNumber extends UserEvent {
  final String phoneNumber;
  final User users;
  const UpdatePhoneNumber({
    required this.phoneNumber,
    required this.users,
  });
  @override
  List<Object> get props => [
        {phoneNumber, users}
      ];
}

class UpdateUserEmail extends UserEvent {
  final String email;
  final User users;
  final BuildContext context;
  const UpdateUserEmail({
    required this.email,
    required this.users,
    required this.context,
  });
  @override
  List<Object> get props => [
        {email, users}
      ];
}


