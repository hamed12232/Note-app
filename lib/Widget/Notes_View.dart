import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Widget/Custom_app_bar.dart';
import 'package:note_app/Widget/Notes_ListView.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:note_app/cubits/theme_cubit.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});
 static bool isDarkMode = false;
  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
   
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
  }
  Widget build(BuildContext context) {
    return   Padding(
      padding:   EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      child:  Column(
        
        children: [
           SizedBox(height: 20,),
        Custom_app_bar(title: "Notes",icon: Icons.brightness_6,onPressed: () {
         context.read<ThemeCubit>().toggleTheme();
        },),
           NotesListView()
      
          
        ],
      ),
    );
  }
}