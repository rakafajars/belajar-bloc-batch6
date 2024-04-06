import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterStateSuccess> {
  CounterBloc() : super(CounterStateSuccess(0)) {
    on<IncrementCounterEvent>(
      (event, emit) => emit(
        CounterStateSuccess(state.value + 1),
      ),
    );

    on<DecrementCounterEvent>(
      (event, emit) => emit(
        CounterStateSuccess(state.value - 1),
      ),
    );
  }
}
