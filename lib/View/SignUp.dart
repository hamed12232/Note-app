import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/Constant.dart';
import 'package:note_app/View/Notes_View_Body.dart';
import 'package:note_app/Widget/CustomTextFieldAuth.dart';
import 'package:note_app/Widget/show_snakBar.dart';

class SignUpView extends StatefulWidget {
  final VoidCallback toggleScreen;

  const SignUpView({required this.toggleScreen});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool _Obsecure = true;
  bool isloading = false; // Set initially to false
  final _auth = FirebaseAuth.instance;

  // Use TextEditingController to capture input
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> kform = GlobalKey();

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
      
        return Form(
          key: kform,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Sign up",
                style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              CustomTextFieldAuth(
                label: 'Email',
                icon: Icons.email,
                controller: emailController,
                pass: false,
              ),
              CustomTextFieldAuth(
                label: 'Password',
                icon: Icons.lock,
                controller: passwordController,
                isPassword: true,
                pass: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onpressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kprimaryColor,
                  padding: const EdgeInsets.all(15),
                ),
                child: isloading?CircularProgressIndicator(color: Colors.black,): Text('Create Account', style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: widget.toggleScreen,
                child: const Text("Already have an account? Log in",
                    style: TextStyle(color: kprimaryColor)),
              ),
            ],
          ),
        );
  }

  onpressed() async {
    if (kform.currentState!.validate()) {
     
      setState(() {
        isloading = true;
      });

     try {
     
      final newuser = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Send email verification
      if (newuser.user != null && !newuser.user!.emailVerified) {
        await newuser.user!.sendEmailVerification();
        showSnackBar(context, "Verification email has been sent. Please check your inbox.");
      }

      // Add a short delay before navigating to ensure the spinner is shown
      await Future.delayed(const Duration(seconds: 1));

      setState(() { isloading = false; });
      } on FirebaseAuthException catch (e) {
        setState(() {
          isloading = false;
        }); // Ensure the spinner is hidden when an error occurs
        if (e.code == "weak-password") {
          showSnackBar(context, "The password provided is too weak");
        } else if (e.code == "email-already-in-use") {
          showSnackBar(context, "The email already exists");
        }
      } catch (ex) {
        setState(() {
          isloading = false;
        }); // Ensure the spinner is hidden when an error occurs
        showSnackBar(context, "There was an error");
      }
    }
  }
}
