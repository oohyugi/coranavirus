import 'package:coranavirus/component/failed_view.dart';
import 'package:coranavirus/component/loading_view.dart';
import 'package:coranavirus/component/pie_chart.dart';
import 'package:coranavirus/feature/bloc/home_state.dart';
import 'package:coranavirus/model/main_mdl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'bloc/home_bloc.dart';

class DasboardView extends StatelessWidget {
  DasboardView({Key key}) : super(key: key);
  MainMdl mainData ;
  final oCcy = new NumberFormat("#,##0", "en_US");
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<HomeBloc,HomeState>(builder: (context,state){

      if(state is SuccessLoadHomeDataState){
       mainData = state.data;
      }
      if (state is LoadingHomeDataState) {
        return LoadingView();
      }
      if (state is FailedLoadHomeDataState) {
        return FailedView(
          message: state.message,
        );
      }
      return mainData!=null?Material(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(14),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.height / 4,
                child: Stack(
                  children: <Widget>[
                    PieOutsideLabelChart(
                      [
                        LinearSales("Confirmed", mainData.confirmed.value),
                        LinearSales("Death", mainData.deaths.value),
                        LinearSales("Recovered", mainData.recovered.value),
                      ],
                      animate: true,
                    ),
                    Align(
                        alignment: Alignment.center,

//                            left: (MediaQuery.of(context).size.height/4)/2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "${oCcy.format(mainData.deaths.value + mainData.recovered.value + mainData.confirmed.value)}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                            Text(
                              "Cases Reported",
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ))
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${oCcy.format(mainData.confirmed.value)}",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Confirmed",
                    style: TextStyle(
                        color: Colors.yellow[600], fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "${oCcy.format(mainData.recovered.value)}",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Recovered",
                    style: TextStyle(
                        color: Colors.green[600], fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "${oCcy.format(mainData.deaths.value)}",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Death",
                    style: TextStyle(
                        color: Colors.red[600], fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ],
          ),
        ),
      ):Container(child: null,);
    });
  }
}
