import 'package:equatable/equatable.dart';

import '../../models/User.dart';

class UserState extends Equatable {
  final List<User> allUsers;
  const UserState(
  {this.allUsers = const <User>[],});

  @override
  List<Object> get props => [allUsers];
}
