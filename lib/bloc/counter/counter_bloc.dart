import 'package:bloc/bloc.dart';
import 'package:simple/bloc/counter/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(
    CounterEvent event,
  ) async* {
    switch (event) {
      case CounterEvent.increment:
        yield this.currentState + 1;
        break;
      case CounterEvent.decement:
        yield this.currentState - 1;
        break;
    }
  }
}
