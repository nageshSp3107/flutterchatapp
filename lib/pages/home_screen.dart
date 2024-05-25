import 'package:flutter/material.dart';
import 'package:flutterapp/services/auth_service.dart';
import 'package:flutterapp/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GetIt _getIt = GetIt.instance;
  late AuthService _authService;
  late NavigationService _navigationService;

  @override
  void initState() {
    super.initState();
    _navigationService = _getIt.get<NavigationService>();
    _authService = _getIt.get<AuthService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        actions: [
          IconButton(
              onPressed: () async {
                bool result = await _authService.logout();
                if (result) {
                  _navigationService.pushReplacementNamed("/login");
                }
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Column(
          children: [Text("Welcome to Chat APP!")],
        ),
      ),
    );
  }
}
