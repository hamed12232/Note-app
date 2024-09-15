import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/Constant.dart';
import 'package:note_app/View/Notes_View_Body.dart';
import 'package:note_app/Widget/CustomTextFieldAuth.dart';
import 'package:note_app/Widget/show_snakBar.dart';

class Loginview extends StatefulWidget {
  final VoidCallback toggleScreen;


  const Loginview({required this.toggleScreen});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
   final _auth=FirebaseAuth.instance;
  late String email;
  late String password;
  GlobalKey<FormState> kform=GlobalKey();
  bool isloading=false;
  bool _Obsecure=true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   
  @override
  Widget build(BuildContext context) {
    return Form(
      key: kform,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        const  Text(
            "Log in",
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        const  SizedBox(height: 40),
          CustomTextFieldAuth(label: 'Email', icon: Icons.email,controller: emailController,pass: false,),
          CustomTextFieldAuth(label: 'Password', icon: Icons.lock, isPassword: true,controller: passwordController,pass: true,),
        const  SizedBox(height: 20),
          ElevatedButton(
            onPressed: onpressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: kprimaryColor, // Fix here
              padding: EdgeInsets.all(15),
            ),
            child: isloading?CircularProgressIndicator(color: Colors.black,): Text('Log in', style: TextStyle(fontSize: 18,color: Colors.black)),
          ),
       const   SizedBox(height: 20),
          TextButton(
            onPressed: widget.toggleScreen,
            child: const Text("Don't have an account? Sign up",
                style: TextStyle(color: kprimaryColor)),
          ),
        ],
      ),
    );
  }
  onpressed()async{

    if(kform.currentState!.validate()){
      setState(() {
        isloading=true;
      });
    
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final user = userCredential.user;

      if (user != null) {
        if (user.emailVerified) {
          // Email is verified, proceed to the next screen
          showSnackBar(context, "Login successful.");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Notes_View_Body(),
            ),
          );
        } else {
          // Email is not verified
          showSnackBar(context, "Please verify your email before logging in.");
          await _auth.signOut(); // Sign out the user if email is not verified
        }
      }
    }  on FirebaseAuthException catch (e) {
     showSnackBar(context, 'Invalid email or Password ');    
    }
        
        isloading=false;
        setState(() {
          
        });
    }
  }
  }

