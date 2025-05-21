part of 'count_bloc.dart';

@immutable
sealed class CountEvent {}

class Increment extends CountEvent {}

class Decrement extends CountEvent {}
