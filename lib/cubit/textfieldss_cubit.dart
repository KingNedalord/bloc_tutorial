import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'textfieldss_state.dart';

class TextfieldssCubit extends Cubit<TextfieldssState> {
  TextfieldssCubit() : super(TextfieldssInitial());

List <String> person1 = [];
  void add_person(String name){
    person1.add(name);
    emit(TextChangedState(person1));
  }
}
