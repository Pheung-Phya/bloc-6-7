import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(CountInitial(count: 0)) {
    on<Increment>((event, emit) {
      emit(CountIncremented(count: state.count + 1));
    });
    on<Decrement>((event, emit) {
      emit(CountDecremented(count: state.count - 1));
    });
  }
}
