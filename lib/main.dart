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
  TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CountCubit, CountState>(
              builder: (context, state) {
                if (state is CountInitial) {
                  return Text(text.text);
                } else {
                  return Text("${text.text}");
                }
              },
            ),
          ),TextField(
            controller: text,
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Text"),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CountCubit>(context).numberChange();
            },
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
