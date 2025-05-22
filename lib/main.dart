import 'package:bloc_api_6_7/bloc/product_bloc.dart';
import 'package:bloc_api_6_7/screens/home_sceen.dart';
import 'package:bloc_api_6_7/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
  ProductService.instance.fetchProducts();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeSceen()),
    );
  }
}
