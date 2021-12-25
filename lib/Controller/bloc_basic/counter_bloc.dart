// import 'package:bloc/bloc.dart';
// import 'package:news_app/Controller/bloc_basic/counter_event.dart';
// import 'package:news_app/Controller/bloc_basic/counter_state.dart';

// //based on flutter_bloc 0.4.12
// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   // CounterBloc(CounterState initialState) : super(initialState);

  
//   @override
//   CounterState get initialState => CounterState.initial();

//   @override 
//   Stream<CounterState> mapEventToState(CounterState currentState, CounterEvent event) async* {
//     if(event is IncrementEvent){
//       yield currentState..counter += 1;
//     }else {
//       yield currentState..counter -= 1;
//     }
//   }

//   void onIncrement() {
//     dispatch(IncrementEvent());
//   }

//   void onDecrement() {
//     dispatch(DecrementEvent());
//   }
  
// }