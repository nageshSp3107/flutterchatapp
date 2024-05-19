import 'package:flutter/material.dart';
import 'package:flutterapp/consts.dart';
import 'package:flutterapp/services/auth_service.dart';
import 'package:flutterapp/services/navigation_service.dart';
import 'package:flutterapp/widgets/custom_formfield.dart';
import 'package:get_it/get_it.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GetIt _getIt = GetIt.instance;
  late AuthService _authService;
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  String? email, password;
  late NavigationService _navigationService;
  @override
  void initState() {
    super.initState();
    _authService = _getIt.get<AuthService>();
    _navigationService = _getIt.get<NavigationService>();
  }

  @override
  Widget build(BuildContext context) {
    return buildUI();
  }

  Widget buildUI() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _loginContents(),
      ),
    );
  }

  Widget _loginContents() {
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
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.40,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedTextFormField(
              hintString: 'Email',
              height: MediaQuery.sizeOf(context).height * 0.1,
              validationRegExp: EMAIL_VALIDATION_REGEX,
              onSaved: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            OutlinedTextFormField(
              hintString: 'Password',
              height: MediaQuery.sizeOf(context).height * 0.1,
              validationRegExp: PASSWORD_VALIDATION_REGEX,
              onSaved: (value) {
                setState(() {
                  password = value;
                });
              },
              obsecureText: true,
            ),
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
        onPressed: () async {
          if (_loginFormKey.currentState?.validate() ?? false) {
            _loginFormKey.currentState?.save();
            bool hasLogged = await _authService.login(email!, password!);
            if (hasLogged) {
              _navigationService.pushReplacementNamed("/home");
            } else {
              print("Error");
            }
          }
        },
        color: Theme.of(context).colorScheme.primary,
        child: const Text(
          'Log In',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _createAccountLink() {
    return const Expanded(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("Don't have a account?"),
        Text(
          " Sign Up",
          style: TextStyle(fontWeight: FontWeight.w800),
        )
      ],
    ));
  }
}
