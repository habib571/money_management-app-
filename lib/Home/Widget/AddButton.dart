import 'package:flutter/material.dart';


class AddButton extends StatelessWidget {
   final void Function() onPressed;

  const AddButton( {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
      onPressed ,
      child: Container(
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          color: Colors.grey[500],
          shape: BoxShape.circle,
        ),
        child:const  Center(
          child: Text(
            '+',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}