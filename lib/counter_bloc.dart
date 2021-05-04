import 'dart:async';

enum CounterAction { Increment, Decrement, Reset }

class CounterBloc {

  // ignore: close_sinks
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;

  // ignore: close_sinks
  final _eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  Stream<CounterAction> get eventStream => _eventStreamController.stream;

  CounterBloc() {
    int counter = 0;

    eventStream.listen((event) {
      if(event == CounterAction.Increment) {
        counter++;
      } else if(event == CounterAction.Decrement) {
        counter--;        
      } else if(event == CounterAction.Reset) {
        counter = 0;
      }

      counterSink.add(counter);
    });
  }

}