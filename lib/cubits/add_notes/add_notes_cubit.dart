import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/Constant.dart';
import 'package:note_app/Modell/notes_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
  Color?color;
  addNote(NoteModels note)async{
    note.color=color!.value;
    emit(AddNotesLoading());
    try {
  var notesBox=Hive.box<NoteModels>(kNotesBox);
  await notesBox.add(note);
    emit(AddNotesSuccess());

}  catch (e) {
  emit(AddNotesFailure(errMessage: e.toString()));
}
  }
}
