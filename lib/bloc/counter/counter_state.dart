part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterStateSuccess extends CounterState {
  int value;

  CounterStateSuccess(this.value);

  @override
  List<Object> get props => [
        value,
      ];
}
