import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note_app/Widget/Custom_Search_Icon.dart';

class Custom_app_bar extends StatelessWidget {
  const Custom_app_bar({super.key, required this.title, required this.icon,this.onPressed});
final String title;
final IconData icon;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        
        Text(title,style: TextStyle(
          fontSize: 28,
        ),),
        Spacer(flex: 1,),
        Custom_Search_Icon(icon: icon,onPressed: onPressed
          
        ,)
      ],
    );
  }
}