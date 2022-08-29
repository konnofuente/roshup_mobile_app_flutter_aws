part of 'services_bloc.dart';

class ServicesState extends Equatable {
  final List<Service> allService;
  const ServicesState(
{    this.allService = const <Service>[],}
    );

  @override
  List<Object> get props => [allService];
}
