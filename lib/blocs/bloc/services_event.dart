import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:roshup_mobile_app_flutter_aws/models/ModelProvider.dart';
import '../../models/Service.dart';

abstract class ServicesEvent extends Equatable {
  const ServicesEvent();

  @override
  List<Object> get props => [];
}

class AddServices extends ServicesEvent {
  final Service service;
  final BuildContext context;
  const AddServices({
    required this.context,
    required this.service,
  });

  @override
  List<Object> get props => [service];
}

class UpdateServices extends ServicesEvent {
  final Service service;
  final String title;
  final String content;
  final PriceRange priceRange;
  final BuildContext context;
  const UpdateServices({
    required this.service, 
    required this.content,
    required this.priceRange,
    required this.context,
    required this.title,
  });

  @override
  List<Object> get props => [title, content, priceRange, context];
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
