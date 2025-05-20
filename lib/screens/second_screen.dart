import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_api_6_7/cubit/counter_cubit.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterCubit>().state.counter;
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 2")),
      body: Column(
        children: [
          Text("Counter: $counter"),
          Center(
            child: BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  "Counter: ${state.counter}",
                  style: TextStyle(fontSize: 28),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().decrement(),
        child: const Icon(Icons.remove),
      ),
    );
  }
}
