import 'package:coranavirus/model/daily_summary_mdl.dart';
import 'package:coranavirus/model/main_mdl.dart';

class HomeState {}

class InitialState extends HomeState {}

class SuccessLoadHomeDataState extends HomeState {
  final MainMdl data;

  SuccessLoadHomeDataState(this.data);
}

class FailedLoadHomeDataState extends HomeState {
  final String message;

  FailedLoadHomeDataState(this.message);
}

class LoadingHomeDataState extends HomeState {}

class SuccessLoadDailyDataState extends HomeState {
  final List<DailySummaryMdl> list;

  SuccessLoadDailyDataState(this.list);
}

class FailedLoadDailyDataState extends HomeState {
  final String message;

  FailedLoadDailyDataState(this.message);
}

class LoadingDailyDataState extends HomeState {}
