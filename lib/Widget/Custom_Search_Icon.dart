import 'package:flutter/material.dart';

class  Custom_Search_Icon extends StatelessWidget {
  const Custom_Search_Icon({super.key, required this.icon, this.onPressed});
final IconData icon;
final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration:  BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16)
      ),
      child: IconButton(onPressed:
        onPressed
      ,icon: Icon(icon),) ,
    );
  }
}