import 'package:bloc_api_6_7/cubit/counter_cubit.dart';
import 'package:bloc_api_6_7/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Screen1()),
    );
  }
}
