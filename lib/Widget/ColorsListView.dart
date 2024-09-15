
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Widget/ColorItem.dart';
import 'package:note_app/Widget/ColorPlatte.dart';
import 'package:note_app/cubits/add_notes/add_notes_cubit.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
int currentindex=0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ColorPalette.palette.length,
        itemBuilder: (context, index) {
      
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child:  GestureDetector(
            onTap: () {
              setState(() {
                              currentindex=index;
            BlocProvider.of<AddNotesCubit>(context).color=ColorPalette.palette[index];

              });
            },
            child: ColorItem(isActive: currentindex==index,color: ColorPalette.palette[index],)),
        );
      },),
    );
  }
}