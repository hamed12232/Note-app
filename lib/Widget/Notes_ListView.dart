import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Modell/notes_model.dart';
import 'package:note_app/Widget/Notes_Item.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_cubit.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
         child: BlocBuilder<NotesCubitCubit,NotesCubitState>(
          builder: (context,state) {
            List<NoteModels> notes=BlocProvider.of<NotesCubitCubit>(context).notes??[];
           return Padding(
             padding: const EdgeInsets.symmetric(vertical: 8.0),
             child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return  Notes_Item(note: notes[index],);
              },
             ),
           );
          },
          
         ),
       );
  }
}