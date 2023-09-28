import 'package:flutter/material.dart';
import 'package:rickandmorty/features/auth/auth.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({super.key});

  @override
  Widget build(BuildContext context) {
    final form = SignInFormInherited.of(context);

    return TextField(
      controller: form.userController,
      decoration: InputDecoration(
        hintText: 'Enter Username',
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
