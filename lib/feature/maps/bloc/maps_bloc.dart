import 'package:bloc/bloc.dart';
import 'package:coranavirus/data/repository/main_repository.dart';
import 'package:coranavirus/feature/maps/bloc/maps_event.dart';
import 'package:coranavirus/feature/maps/bloc/maps_state.dart';
import 'package:dio/dio.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  @override
  MapsState get initialState => InitialState();

  MainRepository _mainRepository = MainRepository();

  @override
  Stream<MapsState> mapEventToState(MapsEvent event) async* {
    if (event is GetListCaseEvent) {
      try {
        var result = await _mainRepository.getConfirmed();
        if (result != null) {
          yield OnSuccessGetListCaseState(result);
        } else {
          yield OnFailedGetListCaseState("Data empty");
        }
      } on DioError catch (e) {
        yield OnFailedGetListCaseState(e.message);
      }
    }
  }
}
