import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Modell/notes_model.dart';
import 'package:note_app/View/Edit_Notes_View.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_cubit.dart';

class Notes_Item extends StatelessWidget {
  const Notes_Item({super.key, required this.note});
final NoteModels note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Edit_Notes_View(note: note,)));
        },
        child: Container(
                padding: const EdgeInsets.only(top: 23,bottom: 23,left: 10),
        
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(note.color)
          ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                
                title:  Text(note.title,style: TextStyle(color: Colors.black,fontSize: 25),),
                subtitle:  Padding(
                  padding: const EdgeInsets.only(top: 14,bottom: 16),
                  child: Text(note.subtitle,style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 15)),
                ),
                trailing: IconButton(onPressed: () {
                 
                },
                icon: IconButton(onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
                },icon:Icon(Icons.delete) ,color: Colors.black,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 27.0),
                child: Text(note.data,style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 12)),
              )
            ],
          ),
        ),
      ),
    );
  }
}