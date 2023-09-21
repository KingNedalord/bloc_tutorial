import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/textfieldss_cubit.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => TextfieldssCubit(),
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
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: BlocBuilder<TextfieldssCubit, TextfieldssState>(
            builder: (context, state) {
              if (state is TextfieldssInitial) {
                return Center(
                  child: Text("Empty list"),
                );
              } else if (state is TextChangedState) {
                return ListView.builder(
                  itemCount: state.person.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.person[index].toString()),
                    );
                  },
                );
              } else {
                return Text("Error");
              }
            },
          ),
        ),
        Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Name"),
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Last name"),
            )
          ],
        ),
        FloatingActionButton(onPressed: () {
          BlocProvider.of<TextfieldssCubit>(context).add_person(name.text);
          name.text = "";
        }),
      ],
    ));
  }
}
