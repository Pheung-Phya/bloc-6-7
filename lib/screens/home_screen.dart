import 'package:bloc_api_6_7/bloc/count_bloc.dart';
import 'package:bloc_api_6_7/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_api_6_7/cubit/counter_cubit.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 1")),
      body: Center(
        child: BlocBuilder<CountBloc, CountState>(
          builder: (context, state) {
            return Text(
              "Counter: ${state.count}",
              style: TextStyle(fontSize: 28),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'incrementBtn',
            onPressed: () => context.read<CountBloc>().add(Increment()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'navbar',
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Screen2()),
                ),
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
