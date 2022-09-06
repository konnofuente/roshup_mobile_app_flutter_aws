part of 'request_bloc.dart';

abstract class RequestEvent extends Equatable {
  const RequestEvent();

  @override
  List<Object> get props => [];
}

class AddRequest extends RequestEvent {
  final Request request;
  final BuildContext context;
  const AddRequest( {
    required this.request,
    required this.context,
  });
  @override
  List<Object> get props => [request];
}

class ClearLocalInfo extends RequestEvent {
  const ClearLocalInfo();
}
