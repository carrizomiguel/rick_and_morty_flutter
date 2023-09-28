import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/features.dart';
import 'package:rickandmorty/shared/shared.dart';

class SignInFormInherited extends InheritedWidget {
  SignInFormInherited({
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  final userController = TextEditingController();
  final passwordController = TextEditingController();

  static SignInFormInherited of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<SignInFormInherited>();
    assert(result != null, 'No SignInFormInherited found in context');
    return result!;
  }

  void dispose() {
    userController.dispose();
    passwordController.dispose();
  }

  (String, String) get model {
    return (
      userController.text,
      passwordController.text,
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<dynamic>(
              builder: (context) => const HomePage(),
            ),
          );
        } else if (state.status == AuthStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            errorSnackbar('Incorrect Credentials!'),
          );
        }
      },
      child: SignInFormInherited(
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              UsernameField(),
              SizedBox(height: 10),
              PasswordField(),
              SizedBox(height: 30),
              SignInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
