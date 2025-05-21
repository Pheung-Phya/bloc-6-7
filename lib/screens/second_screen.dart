import 'package:bloc_api_6_7/bloc/count_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CountBloc>().state.count;
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 2")),
      body: Column(
        children: [
          Text("Counter: $counter"),
          Center(
            child: BlocBuilder<CountBloc, CountState>(
              builder: (context, state) {
                return Text(
                  "Counter: ${state.count}",
                  style: TextStyle(fontSize: 28),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CountBloc>().add(Decrement()),
        child: const Icon(Icons.remove),
      ),
    );
  }
}
