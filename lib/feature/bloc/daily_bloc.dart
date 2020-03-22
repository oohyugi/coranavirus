import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:coranavirus/data/repository/main_repository.dart';
import 'package:coranavirus/feature/bloc/home_event.dart';
import 'package:coranavirus/feature/bloc/home_state.dart';
import 'package:coranavirus/utils/date_helper.dart';
import 'package:dio/dio.dart';

class DailyBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => InitialState();

  MainRepository _mainRepository = MainRepository();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {

    if(event is FetchDaily){
      try {
        yield LoadingDailyDataState();
        var result = await _mainRepository.getADaily();
        if (result != null) {
          result.sort((a,b)=> formatDateToMillisecond(b.reportDateString.replaceAll("/", "")).compareTo(formatDateToMillisecond(a.reportDateString.replaceAll("/", ""))));

          yield SuccessLoadDailyDataState(result);
        } else {
          yield FailedLoadDailyDataState("Data empty");
        }
      } on DioError catch (e) {
        yield FailedLoadDailyDataState(e.message);
      }
    }

  }
}
