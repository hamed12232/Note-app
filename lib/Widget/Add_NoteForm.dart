
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/Modell/notes_model.dart';
import 'package:note_app/Widget/ColorsListView.dart';
import 'package:note_app/Widget/Custom_Button.dart';
import 'package:note_app/Widget/Custom_TextField.dart';
import 'package:note_app/cubits/add_notes/add_notes_cubit.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
 GlobalKey<FormState>formkey=GlobalKey();
 AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
 String? title,subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Custom_TextField(hint: "Title",onsaved: (v) {
            title=v;
          },),
          SizedBox(
            height: 20,
          ),
          Custom_TextField(
            hint: 'Content',
            maxlines: 5,
            onsaved: (v) {
              subtitle=v;
            },
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: const ColorsListView(),
          ),
          BlocBuilder<AddNotesCubit,AddNotesState>(
            builder: (context, state) {
              
            
            return CustomButton(
              isloading: state is AddNotesLoading?true:false,onTap: () {
              if(formkey.currentState!.validate()){
                formkey.currentState!.save();       
                var currentDate=DateTime.now();
                var formattedTime= DateFormat.yMd().format(currentDate);
                var notebook=NoteModels(title: title!,subtitle: subtitle!,data: formattedTime,color: Colors.blue.value);
                BlocProvider.of<AddNotesCubit>(context) .addNote(notebook);
                  }else{
                    autovalidateMode=AutovalidateMode.always;
                    setState(() {
                      
                    });
                  }
            
            
            },);
            }
          )
        ],
      ),
    );
  }
}
