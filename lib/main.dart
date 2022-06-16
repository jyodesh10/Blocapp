import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/bloc/momo_bloc.dart';
import 'package:pizza_app/models/momo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => MomoBloc()..add(LoadMomoCounter())))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Momo"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: BlocBuilder<MomoBloc, MomoState>(
            builder: (context, state) {
              if (state is MomoInitial) {
                return const CircularProgressIndicator();
              } else if (state is MomoLoaded) {
                return Column(
                  children: [
                    Text(state.momos.length.toString()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 1.5,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          for (int index = 0;
                              index < state.momos.length;
                              index++)
                            Positioned(
                                right: Random().nextInt(270).toDouble(),
                                top: Random().nextInt(400).toDouble(),
                                child: SizedBox(
                                    height: 150,
                                    child: state.momos[index].image))
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return const Text('No data');
              }
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: () {
            context.read<MomoBloc>().add(AddMomo(Momo.momos[0]));
          })
        ],
      ),
    );
  }
}
