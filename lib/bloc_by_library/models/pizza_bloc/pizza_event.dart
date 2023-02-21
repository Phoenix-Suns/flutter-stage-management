part of 'pizza_bloc.dart';

@immutable
abstract class PizzaEvent extends Equatable {
  const PizzaEvent();

  @override
  List<Object?> get props => [];
}

class LoadPizzaCounterEvent extends PizzaEvent {}

class AddPizzaEvent extends PizzaEvent {
  final Pizza pizza;

  const AddPizzaEvent(this.pizza);

  @override
  List<Object?> get props => [pizza];
}
class RemovePizzaEvent extends PizzaEvent {
  final Pizza pizza;

  const RemovePizzaEvent(this.pizza);

  @override
  List<Object?> get props => [pizza];
}

