import 'package:equatable/equatable.dart';
import '../../models/Service.dart';


abstract class ServicesEvent extends Equatable {
  const ServicesEvent();

  @override
  List<Object> get props => [];
}

class AddServices extends ServicesEvent {
  final Service service;
  const AddServices({
    required this.service,
  });

   @override
  List<Object> get props => [service];
}


class UpdateServices extends ServicesEvent {
  final Service service;
  const UpdateServices({
    required this.service,
  });

     @override
  List<Object> get props => [service];
}


class DeleteServices extends ServicesEvent {
  final Service service;
  const DeleteServices({
    required this.service,
  });

     @override
  List<Object> get props => [service];
}