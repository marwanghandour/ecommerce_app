import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/presentation/app_routes.dart';
import '../blocs/auth/auth_bloc.dart';
import '../blocs/auth/auth_event.dart';
import '../blocs/auth/auth_state.dart';
import 'custom_button_widget.dart';
import 'custom_snack_bar.dart';
import 'custom_text_field.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          CustomTextField(
            controller: emailController,
            labelText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: passwordController,
            labelText: 'Password',
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: confirmPasswordController,
            labelText: 'Confirm Password',
            isPassword: true,
            validator: (value) {
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomButtonWidget(
            text: 'Sign Up',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                BlocProvider.of<AuthBloc>(context).add(
                  SignUpEvent(
                    emailController.text,
                    passwordController.text,
                  ),
                );
              }
            },
          ),
          BlocListener<AuthBloc, MyAuthState>(
            listener: (context, state) {
              if (state is AuthSuccessState) {
                CustomSnackBar.show(
                  context, 'Signed Up as ${state.email}',
                  color: Colors.green,
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
                  (Route<dynamic> route) => false,
                );
              } else if (state is AuthFailureState) {
                CustomSnackBar.show(
                  context, state.message,
                );
              }
            },
            child: BlocBuilder<AuthBloc, MyAuthState>(
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const CircularProgressIndicator();
                }
                return Container();
              },
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context,
               AppRoutes.login
               );
            },
            child: const Text('Already have an account? Sign In'),
          ),
        ],
      ),
    );
  }
}
