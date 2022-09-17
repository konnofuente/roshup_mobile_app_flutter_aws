import 'dart:async';
import 'package:amplify_api/model_mutations.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:roshup_mobile_app_flutter_aws/models/ModelProvider.dart';

part 'request_event.dart';
part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  RequestBloc() : super(const RequestState()) {
    on<AddRequest>(_onAddRequest);
  }

  Future<FutureOr<void>> _onAddRequest(
      AddRequest event, Emitter<RequestState> emit) async {
    final state = this.state;
    var context = event.context;
    String alertText = 'could not send Request check your mobile connection';
    String successText = 'Successfully send Request';
    emit(RequestState(
        allRequests: List.from(state.allRequests)..add(event.request)));
    try {
      final newRequest = event.request;
      final request = ModelMutations.create(newRequest);
      final response = await Amplify.API.mutate(request: request).response;

      final createdRequest = response.data;

      if (createdRequest == null) {
        AlertDialogue(context, alertText);
        print('errors: ${response.errors}');
      }
      saveRequestDialogue(context, event.request, successText);
      print('Mutation result: ${createdRequest?.title}');
    } on ApiException catch (e) {
      print('Mutation failed: $e');
    }
  }
}

void AlertDialogue(BuildContext context, String alertText) {
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Column(children: [
      Text(alertText),
      const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'))
    ],),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void saveRequestDialogue(
    BuildContext context, Request request, String sucessText) {
  AlertDialog alert = AlertDialog(
    title: Text(sucessText),
    content: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Column(
        children: [
          Text('Request Title: ${request.title}'),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'))
        ],
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
