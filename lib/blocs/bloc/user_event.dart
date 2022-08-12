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

// class UpdateUsersName extends UserEvent {
//   final User users;
//   const UpdateUsersName({
//     required this.users,
//   });
//   @override
//   List<Object> get props => [users];
// }

class UpdateUsersName extends UserEvent {
  final String name;
  final User users;
  const UpdateUsersName({
    required this.name,
    required this.users,
  });
  @override
  List<Object> get props => [
        {name, users}
      ];
}

class UpdatePhoneNumber extends UserEvent {
  final String phone_number;
  final User users;
  const UpdatePhoneNumber({
    required this.phone_number,
    required this.users,
  });
  @override
  List<Object> get props => [
        {phone_number, users}
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
