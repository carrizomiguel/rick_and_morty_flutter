import 'package:flutter/material.dart';
import 'package:rickandmorty/features/features.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final form = SignInFormInherited.of(context);

    return TextField(
      obscureText: true,
      controller: form.passwordController,
      decoration: InputDecoration(
        hintText: '*********',
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
      ),
    );
  }
}
