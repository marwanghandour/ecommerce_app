import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_event.dart';
import '../../blocs/auth/auth_state.dart';
import 'sign_in_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
              Navigator.pushReplacement(
                context,
               MaterialPageRoute(builder: (context) => const SignInPage())
               );
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<AuthBloc, MyAuthState>(
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is AuthFailureState) {
              return Text(state.message);
            } else if (state is AuthSuccessState) {
              return Text('Signed in as ${state.email}');
            }
            return Container();
          },
        ),
      ),
    );
  }
}
