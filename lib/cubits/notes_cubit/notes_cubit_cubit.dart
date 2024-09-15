import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/Constant.dart';
import 'package:note_app/Modell/notes_model.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());

  List<NoteModels>? notes;

  fetchAllNotes(){
   
    var notesBox=Hive.box<NoteModels>(kNotesBox);
  notes=notesBox.values.toList();
   emit(NotesSuccess());
  }
}
