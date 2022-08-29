import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/Service.dart';
import 'services_event.dart';

part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  ServicesBloc() : super(const ServicesState()) {
    on<AddServices>(_onAddService);
    on<UpdateServices>(_onUpdateService);
    on<DeleteServices>(_onDeleteService);
  }

  Future<FutureOr<void>> _onAddService(
      AddServices event, Emitter<ServicesState> emit) async {
    final state = this.state;
    emit(ServicesState(
        allService: List.from(state.allService)..add(event.service)));

    final newService = Service(
      title: event.service.title,
      priceRange: event.service.priceRange,
    );

    try {
      await Amplify.DataStore.save(newService);
      print('Succesfully save!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
    } catch (e) {
      print('An error occurred while saving SERVICE: $e');
    }
  }

  Future<FutureOr<void>> _onUpdateService(
      UpdateServices event, Emitter<ServicesState> emit) async {
    final state = this.state;
    final service = event.service;
    final index = state.allService.indexOf(service);
    List<Service> allService = List.from(state.allService)..remove(service);
    allService.insert(
        index,
        service.copyWith(
            title: event.service.title, priceRange: event.service.priceRange));

    final updatedItem = service.copyWith(
        title: event.service.title, priceRange: event.service.priceRange);

    try {
      await Amplify.DataStore.save(updatedItem);
      print('Succesfully UPDATE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
    } catch (e) {
      print('An error occurred while saving SERVICE: $e');
    }


      emit(ServicesState(
      allService: allService,
      ));
  }



  Future<FutureOr<void>> _onDeleteService(
      DeleteServices event, Emitter<ServicesState> emit) async {
    final state = this.state;
    final service = event.service;
    final index = state.allService.indexOf(service);

    List<Service> allService = List.from(state.allService)..remove(service);
    

    try {
      await Amplify.DataStore.delete(service);
      print('Succesfully DELETE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
    } catch (e) {
      print('An error occurred while saving SERVICE: $e');
    }
    
    emit(ServicesState(allService:allService));

      }
}
