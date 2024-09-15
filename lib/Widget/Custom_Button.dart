import 'package:flutter/material.dart';
import 'package:note_app/Constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap,  this.isloading=false});
  final bool isloading;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: BoxDecoration(
          color: kprimaryColor,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Center(child:isloading? const CircularProgressIndicator(color: Colors.black,): const Text
        ("Save",style: TextStyle(color: Colors.black,fontSize: 20),)),
      ),
    );
  }
}