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


class UpdateUsers extends UserEvent {
  final User users;
  const UpdateUsers({
    required this.users,
  });
  @override
  List<Object> get props => [users];
}


