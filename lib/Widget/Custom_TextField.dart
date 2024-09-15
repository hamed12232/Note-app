import 'package:flutter/material.dart';
import 'package:note_app/Constant.dart';

class Custom_TextField extends StatelessWidget {
  const Custom_TextField({super.key, required this.hint,  this.maxlines=1,  this.onsaved, this.onChanged});
final String hint;
final int maxlines;
final void Function(String?)? onsaved;
final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onChanged: onChanged,
      onSaved: onsaved,
      validator: (value) {
        if(value?.isEmpty??true){
            return "Field is required";
        }return null;
      },
      maxLines: maxlines,
      cursorColor: kprimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        
        hintStyle: const TextStyle(color: kprimaryColor),
        border: BuildBorder(),
        enabledBorder: BuildBorder(),
        focusedBorder: BuildBorder(kprimaryColor)
      ),
    );
  }

  OutlineInputBorder BuildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color??Colors.white)
      );
  }
}