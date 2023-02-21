part of 'pizza_bloc.dart';

@immutable
abstract class PizzaState extends Equatable {
  const PizzaState();

  @override
  List<Object?> get props => [];
}

class PizzaInitialState extends PizzaState {}

class PizzaLoadedState extends PizzaState {
  final List<Pizza> pizzas;
  const PizzaLoadedState({required this.pizzas});

  @override
  List<Object?> get props => [pizzas];
}
