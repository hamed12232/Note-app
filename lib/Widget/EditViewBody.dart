import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Widget/Custom_TextField.dart';
import 'package:note_app/Widget/Custom_app_bar.dart';
import 'package:note_app/Modell/notes_model.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_cubit.dart';


class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key,required this.note});
final NoteModels note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  @override
  String? title,subtitle;
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
      child: Column(children: [
        SizedBox(height: 20,),
        Custom_app_bar(title: "Edit Notes",icon: Icons.done,onPressed: () {
          widget.note.title=title??widget.note.title;
          widget.note.subtitle=subtitle??widget.note.subtitle;
          widget.note.save();
          BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
          Navigator.pop(context);
        },),
                SizedBox(height: 20,),

        Custom_TextField(hint: widget.note.title,onChanged: (v) {
          title=v;
        },),
                SizedBox(height: 12,),

        Custom_TextField(hint: widget.note.subtitle,maxlines: 5,onChanged: (v) {
          subtitle=v;
        },)
      ],),
    );
  }
}