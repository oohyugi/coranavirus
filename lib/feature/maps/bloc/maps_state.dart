import 'package:coranavirus/model/confirmed_mdl.dart';

class MapsState {}

class InitialState extends MapsState{}
class OnSuccessGetListCaseState extends MapsState{
  final List<ConfirmedMdl> response;

  OnSuccessGetListCaseState(this.response);
}
class OnFailedGetListCaseState extends MapsState {
  final String message;

  OnFailedGetListCaseState(this.message);
}