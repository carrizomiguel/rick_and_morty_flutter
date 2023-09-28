import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/core.dart';
import 'package:rickandmorty/features/features.dart';
import 'package:rickandmorty/shared/shared.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const SignInBody(),
    );
  }
}

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Layout.setHeight(context, 10),
              ),
              Image.asset(
                Assets.logo,
                height: 70,
              ),
              SizedBox(
                height: Layout.setHeight(context, 5),
              ),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Layout.setHeight(context, 5),
              ),
              const SignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
