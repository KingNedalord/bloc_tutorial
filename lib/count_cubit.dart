import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'count_state.dart';

class CountCubit extends Cubit<CountState> {
  CountCubit() : super(CountInitial());

  int num = 0;

  void numberChange(){
    num++;
    emit(NumberChange(num));
  }
}
