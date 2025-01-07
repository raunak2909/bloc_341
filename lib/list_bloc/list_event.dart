import 'package:bloc_341/note_model.dart';

abstract class ListEvent{}

class AddItemEvent extends ListEvent{
  NoteModel newNote;
  AddItemEvent({required this.newNote});
}
class UpdateItemEvent extends ListEvent{
  NoteModel updateNote;
  int index;
  UpdateItemEvent({required this.updateNote, required this.index});
}
class RemoveItemEvent extends ListEvent{
  int index;
  RemoveItemEvent({required this.index});
}