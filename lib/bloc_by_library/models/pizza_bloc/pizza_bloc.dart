import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../pizza_model.dart';

part 'pizza_event.dart';
part 'pizza_state.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc() : super(PizzaInitialState()) {

    on<LoadPizzaCounterEvent>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(PizzaLoadedState(pizzas: <Pizza>[]));
    });

    on<AddPizzaEvent>((event, emit) {
      if (state is PizzaLoadedState) {
        final state = this.state as PizzaLoadedState;
        emit(PizzaLoadedState(pizzas: List.from(state.pizzas)..add(event.pizza)));
      }
    });

    on<RemovePizzaEvent>((event, emit) {
      if (state is PizzaLoadedState) {
        final state = this.state as PizzaLoadedState;
        emit(PizzaLoadedState(pizzas: List.from(state.pizzas)..remove(event.pizza)));
      }
    });
  }
}
