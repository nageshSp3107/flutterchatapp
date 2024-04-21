import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/custom_formfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return buildUI();
  }

  Widget buildUI() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: login_contents(),
      ),
    );
  }

  Widget login_contents() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [_headerText(), _loginForm(), _createAccountLink()],
      ),
    );
  }

  Widget _headerText() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi Nagesh! Welcome back,',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            'Hello again you have been missed ',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.40,
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomFormField(
              hintString: 'Email',
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            CustomFormField(
                hintString: 'Password',
                height: MediaQuery.sizeOf(context).height * 0.1),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: MaterialButton(
        onPressed: () {},
        color: Theme.of(context).colorScheme.primary,
        child: const Text(
          'Log In',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _createAccountLink() {
    return Expanded(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text("Don't have a account?"),
        const Text(
          " Sign Up",
          style: TextStyle(fontWeight: FontWeight.w800),
        )
      ],
    ));
  }
}
