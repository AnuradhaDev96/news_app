class CounterState {
  int counter; //can initialize a value. Instead implement factory as belows

  //creating a factory for the state
  CounterState._(); //private counstructor

  //factory for initial state
  factory CounterState.initial() {
    return CounterState._()..counter = 0;
  }
}
