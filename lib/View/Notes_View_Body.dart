import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Constant.dart';
import 'package:note_app/Widget/Add_Note_ButtonSheet.dart';
import 'package:note_app/Widget/Notes_View.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_cubit.dart';

class Notes_View_Body extends StatelessWidget {
  const Notes_View_Body({super.key});
    static const String notesPage ="Notes Page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        
        backgroundColor: kprimaryColor,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(18)),
        onPressed: () {
         showModalBottomSheet(isScrollControlled: true,context: context, builder: (context) {
        
           return Add_Note_ButtonSheet();
         },);
      },child: const Icon(Icons.add,color: Colors.black,),),
      body: const NotesView(),
    );
  }
}