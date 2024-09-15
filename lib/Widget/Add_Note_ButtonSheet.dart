import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/Widget/Add_NoteForm.dart';
import 'package:note_app/cubits/add_notes/add_notes_cubit.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_cubit.dart';

class Add_Note_ButtonSheet extends StatelessWidget {
   const Add_Note_ButtonSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if(state is AddNotesFailure){
              
          }
          if(state is AddNotesSuccess){
            BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNotesLoading?true:false,child: Padding(
              padding:  EdgeInsets.only(left: 16,right: 16,bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(child: AddNoteForm()),
            ));
        },
      ),
    );
  }
}
