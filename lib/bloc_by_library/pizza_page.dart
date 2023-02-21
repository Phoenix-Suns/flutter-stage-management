import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc_by_library/models/pizza_model.dart';

import 'models/pizza_bloc/pizza_bloc.dart';

class PizzaView extends StatelessWidget {
  PizzaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //child: Text('Âm lượng hiện tại: 000'),
        child: BlocBuilder<PizzaBloc, PizzaState>(
          builder: (context, state) {
            if (state is PizzaInitialState) {
              return const CircularProgressIndicator(
                color: Colors.blueAccent,
              );
            }
            if (state is PizzaLoadedState) {
              return Text("Pizza hiện tại ${state.pizzas.length}");
            } else {
              return Text("Something went wrong!!!");
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.person_add_alt_1),
            onPressed: () =>
            {
              context.read<PizzaBloc>().add(AddPizzaEvent(Pizza.pizzas[0]))
            }, // add event <=== new
          ),
          FloatingActionButton(
            child: Icon(Icons.person_remove_alt_1),
            onPressed: () =>
            {
              context.read<PizzaBloc>().add(RemovePizzaEvent(Pizza.pizzas[0]))
            }, // add event <=== new
          ),
          FloatingActionButton(
            child: Icon(Icons.volume_mute),
            onPressed: () => {}, // add event <=== new
          )
        ],
      ),
    );
  }
}
