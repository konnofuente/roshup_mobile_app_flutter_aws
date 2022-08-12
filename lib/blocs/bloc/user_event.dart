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
  const UpdateUsersName( {
    required this.name,
    required this.users,
  });
  @override
  List<Object> get props => [{
    name,users
  }];
}
