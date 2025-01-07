import 'package:bloc_341/list_bloc/list_event.dart';
import 'package:bloc_341/list_bloc/list_state.dart';
import 'package:bloc_341/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBloc extends Bloc<ListEvent, ListState>{

  ListBloc() : super(ListState(mNotes: [])){

    on<AddItemEvent>((event, emit){
      List<NoteModel> currValue = state.mNotes;

      currValue.add(event.newNote);

      emit(ListState(mNotes: currValue));

    });

    on<UpdateItemEvent>((event, emit){
      
      List<NoteModel> currentStateValue = state.mNotes;

      currentStateValue[event.index] = event.updateNote;
      
      emit(ListState(mNotes: currentStateValue));

    });

    on<RemoveItemEvent>((event, emit){
      List<NoteModel> currentStateValue = state.mNotes;
      
      currentStateValue.removeAt(event.index);
      
      emit(ListState(mNotes: currentStateValue));
    });

  }

}