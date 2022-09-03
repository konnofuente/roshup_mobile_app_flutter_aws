import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../models/Service.dart';

abstract class ServicesEvent extends Equatable {
  const ServicesEvent();

  @override
  List<Object> get props => [];
}

class AddServices extends ServicesEvent {
  final Service service;
  final BuildContext context;
  const AddServices( {
    required this.context,
    required this.service,
  });

  @override
  List<Object> get props => [service];
}

class UpdateServices extends ServicesEvent {
  final Service service;
  final BuildContext context;
  const UpdateServices({
    required this.context,
    required this.service,
  });

  @override
  List<Object> get props => [service];
}

class DeleteServices extends ServicesEvent {
  final Service service;
  final BuildContext context;
  const DeleteServices({
    required this.context,
    required this.service,
  });

  @override
  List<Object> get props => [service];
}
