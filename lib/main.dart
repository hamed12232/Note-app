import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/Constant.dart';
import 'package:note_app/Modell/notes_model.dart';
import 'package:note_app/View/AuthScreen.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:note_app/cubits/theme_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:note_app/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, 
  );
  await Hive.initFlutter();
    Hive.registerAdapter(NoteModelsAdapter());
  await Hive.openBox<NoteModels>(kNotesBox);
  runApp( const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesCubitCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
          
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: AuthScreen(),
          );
        },
      ),
    );
  }
}
