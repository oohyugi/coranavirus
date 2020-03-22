import 'package:coranavirus/component/appbar.dart';
import 'package:coranavirus/component/failed_view.dart';
import 'package:coranavirus/component/loading_view.dart';
import 'package:coranavirus/feature/bloc/daily_bloc.dart';
import 'package:coranavirus/feature/bloc/home_bloc.dart';
import 'package:coranavirus/feature/bloc/home_event.dart';
import 'package:coranavirus/feature/bloc/home_state.dart';
import 'package:coranavirus/feature/dasboar_view.dart';
import 'package:coranavirus/feature/daily_view.dart';
import 'package:coranavirus/model/main_mdl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc = HomeBloc();
  DailyBloc _dailyBloc = DailyBloc();
  MainMdl _mainData;

  @override
  void initState() {
    super.initState();
    _homeBloc..add(FetchDasboard());
    _dailyBloc..add(FetchDaily());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appbar(context: context, title: "Covid-19"),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(create: (context)=>_homeBloc),
          BlocProvider<DailyBloc>(create: (context)=>_dailyBloc),
        ],
          child: SingleChildScrollView(
            child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[


                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DasboardView(),
                ),
                SizedBox(height: 16,),
                DailyView()
              ],),

          ),
          ),
    );
  }
}
