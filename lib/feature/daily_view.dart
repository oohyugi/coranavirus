import 'package:coranavirus/component/chart_view.dart';
import 'package:coranavirus/component/failed_view.dart';
import 'package:coranavirus/component/loading_view.dart';
import 'package:coranavirus/component/pie_chart.dart';
import 'package:coranavirus/feature/bloc/daily_bloc.dart';
import 'package:coranavirus/feature/daily_item_view.dart';
import 'package:coranavirus/model/daily_summary_mdl.dart';
import 'package:coranavirus/model/main_mdl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';

class DailyView extends StatelessWidget {
  DailyView({Key key}) : super(key: key);

  final oCcy = new NumberFormat("#,##0", "en_US");
  List<DailySummaryMdl> list = List();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyBloc,HomeState>(builder: (context,state){

      if(state is SuccessLoadDailyDataState){

        list.addAll(state.list);
      }
      if (state is LoadingDailyDataState) {
//        return LoadingView();
      }
      if (state is FailedLoadDailyDataState) {
        return FailedView(
          message: state.message,
        );
      }
      return  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text("Daily Updates",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Theme.of(context).primaryColor),),
                    ),
                    SizedBox(height: 16,),
                    ListView.builder(itemBuilder: (context,i){

                      return DailyItemView(data: list[i],);
                    },itemCount:list.length , shrinkWrap:true,physics: NeverScrollableScrollPhysics())
                  ],



      );
    });
  }
}
