import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // maxLength: 200,
      controller: controller,
      maxLines: 1,
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'ejem. plopez@mail.com',
        prefixIcon: Icon(Icons.email),
      ),
    );
  }
}
