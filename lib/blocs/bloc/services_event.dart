part of 'services_bloc.dart';

abstract class ServicesEvent extends Equatable {
  const ServicesEvent();

  @override
  List<Object> get props => [];
}

class AddServices extends ServicesEvent {
  final SERVICE service;
  const AddServices({
    required this.service,
  });

   @override
  List<Object> get props => [service];
}


class UpdateServices extends ServicesEvent {
  final SERVICE service;
  const UpdateServices({
    required this.service,
  });

     @override
  List<Object> get props => [service];
}


class DeleteServices extends ServicesEvent {
  final SERVICE service;
  const DeleteServices({
    required this.service,
  });

     @override
  List<Object> get props => [service];
}