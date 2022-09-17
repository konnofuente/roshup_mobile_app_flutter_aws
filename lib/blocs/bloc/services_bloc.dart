import 'dart:async';

import 'package:amplify_api/model_mutations.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/Service.dart';
import 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  ServicesBloc() : super(const ServicesState()) {
    on<AddServices>(_onAddService);
    on<UpdateServices>(_onUpdateService);
    on<DeleteServices>(_onDeleteService);
    on<AddRequestServices>(_onAddRequestService);
  }

  Future<FutureOr<void>> _onAddService(
      AddServices event, Emitter<ServicesState> emit) async {
    final state = this.state;
    var context = event.context;
    String alertText = 'could not save Service check your mobile connection';
    emit(ServicesState(
        allService: List.from(state.allService)..add(event.service)));
    try {
      final newService = Service(
        title: event.service.title,
        content: event.service.content,
        priceRanges: event.service.priceRanges,
      );

      final request = ModelMutations.create(newService);
      final response = await Amplify.API.mutate(request: request).response;

      final createdService = response.data;

      if (createdService == null) {
        AlertDialogue(context, alertText);
        print('errors: ${response.errors}');
      }
      saveServiceDialogue(context, event.service);
      print('Mutation result: ${createdService?.title}');
    } on ApiException catch (e) {
      print('Mutation failed: $e');
    }
  }

  Future<FutureOr<void>> _onUpdateService(
      UpdateServices event, Emitter<ServicesState> emit) async {
    final service = event.service;

    final updatedService = service.copyWith(
		title: "Lorem ipsum dolor sit amet",
		content: "Lorem ipsum dolor sit amet",
		// priceRange: /* Provide a PriceRange instance here */,
		// image: /* Provide a Image instance here */,
		roshubPoints: [],
		requests: []);

    // final todoWithNewName = originalTodo.copyWith(name: 'new name');

    // final request = ModelMutations.update(todoWithNewName);
    // final response = await Amplify.API.mutate(request: request).response;
    // print('Response: $response');

    // List<Service> allService = List.from(state.allService)..remove(service);
    // allService.insert(
    //     index,
    //     service.copyWith(
    //         title: event.service.title, priceRange: event.service.priceRange));

    // final updatedItem = service.copyWith(
    //     title: event.service.title, priceRange: event.service.priceRange);

    // emit(ServicesState(
    //   allService: allService,
    // ));
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

    emit(ServicesState(allService: allService));
  }

  void saveServiceDialogue(BuildContext context, Service service) {
    AlertDialog alert = AlertDialog(
      title: Text("Successfully Saved Service"),
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          children: [
            Text('SERVICE NAME: ${service.title}'),
            Text('SERVICE CONTENT: ${service.content}'),
          ],
        ),
      ),
      // actions: [
      //   okButton,
      // ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void AlertDialogue(BuildContext context, String alertText) {
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text(alertText),
      // actions: [
      //   okButton,
      // ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<FutureOr<void>> _onAddRequestService
  (AddRequestServices event, Emitter<ServicesState> emit) async {
      final service = event.service;

    final updatedService = service.copyWith(
		requests: event.requestService);

    final request = ModelMutations.update(updatedService);
    final response = await Amplify.API.mutate(request: request).response;
    print('Response: $response');
  }
}
