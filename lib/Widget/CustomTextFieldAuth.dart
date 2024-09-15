import 'package:flutter/material.dart';

class CustomTextFieldAuth extends StatefulWidget {
  final String label;
  final IconData icon;
  bool pass;
  bool isPassword;
  TextEditingController controller = TextEditingController();

   CustomTextFieldAuth(
      {super.key, required this.label, required this.icon, this.isPassword = false,required this.pass,required this.controller});

  @override
  State<CustomTextFieldAuth> createState() => _CustomTextFieldAuthState();
}

class _CustomTextFieldAuthState extends State<CustomTextFieldAuth> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
       validator: (value) {
          if(value!.isEmpty)
        return "Field is required";
       },
       controller: widget.controller,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          labelText: widget.label,
          suffix:widget.pass? IconButton(
                    icon: widget.isPassword?Icon(Icons.visibility):Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        widget.isPassword=!widget.isPassword;
                      });
                    },
                    ):Text(""),
          labelStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(widget.icon, color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
