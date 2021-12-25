// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/Controller/bloc_basic/counter_bloc.dart';
// import 'package:news_app/Controller/bloc_basic/counter_state.dart';



// //Home page with scratch bloc implementation
// class CounterPage extends StatefulWidget {
//   const CounterPage({Key key}) : super(key: key);

//   @override
//   State<CounterPage> createState() => _CounterPageState();
// }

// class _CounterPageState extends State<CounterPage> {
//   // int _counter = 0;
//   final _counterBloc = CounterBloc();

//   // void incrementCounter() {
//   //   setState(() {
//   //     _counter++;
//   //   });
//   // }

//   // void decrementCounter() {
//   //   setState(() {
//   //     _counter--;
//   //   });
//   // }
//   @override
//   void dispose() {
//     super.dispose();
//     _counterBloc.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Screen'),
//         backgroundColor: Colors.amber,
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text('Pushed the button this many times:'),
//               BlocBuilder(
//                 bloc: _counterBloc,
//                 builder: (BuildContext context, CounterState state) {
//                   return Text(
//                     '${state.counter}',
//                     style: (const TextStyle(
//                     fontSize: 20, fontWeight: FontWeight.bold)),
//                   );
//                 }
//               )
//               // Text(
//               //   '$_counter',
//               //   style: (const TextStyle(
//               //       fontSize: 20, fontWeight: FontWeight.bold)),
//               // )
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () => _counterBloc.onIncrement(),
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             tooltip: 'Decrement',
//             onPressed: () => _counterBloc.onDecrement(),
//             child: const Icon(Icons.remove),
//           )
//         ],
//       ),
//     );
//   }
// }
