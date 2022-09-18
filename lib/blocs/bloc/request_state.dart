part of 'request_bloc.dart';

class RequestState extends Equatable {
  final List<Request?> allRequests;
  const RequestState(
    {this.allRequests = const <Request>[],});

  @override
  List<Object> get props => [allRequests];
}

