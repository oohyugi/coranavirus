import 'package:coranavirus/feature/home_page.dart';
import 'package:coranavirus/feature/maps/maps_visual.dart';
import 'package:coranavirus/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class MyBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = MyBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Virus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        backgroundColor: Colors.white,
        primaryColor: Colors.lightGreenAccent,
        brightness: Brightness.light,
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        backgroundColor: HexColor("#2c2c2c"),
          brightness: Brightness.dark,
          primarySwatch: Colors.green,
          primaryColor: Colors.lightGreenAccent),
      home: MapsVisual(),
    );
  }
}
