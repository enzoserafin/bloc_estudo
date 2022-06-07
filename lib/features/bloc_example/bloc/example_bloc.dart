import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleStateInitial()) {
    on<ExampleFindNameEvent>(_findName);
    on<ExampleRemoveNameEvent>(_removeName);
    on<ExampleAddNameEvent>(_addName);
  }

  FutureOr<void> _addName(
    ExampleAddNameEvent event,
    Emitter<ExampleState> emit,
  ) {
    final stateExample = state;

    if (stateExample is ExampleStateData) {
      final names = [...stateExample.names];
      names.add(event.name);
      emit(ExampleStateData(names: names));
    }
  }

  FutureOr<void> _removeName(
    ExampleRemoveNameEvent event,
    Emitter<ExampleState> emit,
  ) {
    final stateExample = state;

    if (stateExample is ExampleStateData) {
      final names = [...stateExample.names];
      names.retainWhere((item) => item != event.name);
      emit(ExampleStateData(names: names));
    }
  }

  FutureOr<void> _findName(
    ExampleFindNameEvent event,
    Emitter<ExampleState> emit,
  ) async {
    final names = [
      'Obi-Wan',
      'Anakin-Skywalker',
      'Yoda',
      'Kylo-Ren',
      'Luke-Skywalker',
      'Conde-Dukan'
    ];
    await Future.delayed(const Duration(seconds: 2));

    emit(ExampleStateData(names: names));
  }
}
