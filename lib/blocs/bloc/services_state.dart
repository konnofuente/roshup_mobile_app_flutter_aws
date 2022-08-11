part of 'services_bloc.dart';

class ServicesState extends Equatable {
  final List<SERVICE> allService;
  const ServicesState(
{    this.allService = const <SERVICE>[],}
    );

  @override
  List<Object> get props => [allService];
}
