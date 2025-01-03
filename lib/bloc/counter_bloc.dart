import 'package:bloc_341/bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int>{

  CounterBloc() : super(0){

    on<IncrementCountEvent>((event, emit){
      emit(state+1);
    });

    on<DecrementCountEvent>((event, emit){
      if(state>0){
        emit(state-1);
      }
    });

  }


}