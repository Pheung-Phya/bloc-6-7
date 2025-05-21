part of 'count_bloc.dart';

abstract class CountState {
  final int count;
  CountState({required this.count});
}

final class CountInitial extends CountState {
  CountInitial({required super.count});
}

final class CountIncremented extends CountState {
  CountIncremented({required super.count});
}

final class CountDecremented extends CountState {
  CountDecremented({required super.count});
}
