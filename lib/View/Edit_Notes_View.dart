import 'package:flutter/material.dart';
import 'package:note_app/Widget/EditViewBody.dart';
import 'package:note_app/Modell/notes_model.dart';


class Edit_Notes_View extends StatelessWidget {
  const Edit_Notes_View({super.key,required this.note});
final NoteModels note;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EditViewBody(note: note,),
    );
  }
}