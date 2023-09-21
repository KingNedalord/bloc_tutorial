part of 'textfieldss_cubit.dart';

@immutable
abstract class TextfieldssState {}

class TextfieldssInitial extends TextfieldssState {}

class TextChangedState extends TextfieldssState {
  List <String> person = [];

  TextChangedState(this.person);
}
