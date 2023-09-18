import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'count_cubit.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => CountCubit(),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: BlocBuilder<CountCubit, CountState>(
              builder: (context, state) {
                if (state is CountInitial) {
                  return Text("0");
                } else {
                  return Text("${(state as NumberChange).number}");
                }
              },
            ),
          ),
          FloatingActionButton(onPressed: () {
            BlocProvider.of<CountCubit>(context).numberChange();
          })
        ],
      ),
    );
  }
}
