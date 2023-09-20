import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'count_state.dart';

class CountCubit extends Cubit<CountState> {
  CountCubit() : super(CountInitial());



  void numberChange(){
    emit(NumberChange());
  }
}
