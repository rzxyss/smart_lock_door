import 'package:flutter/material.dart';
import 'pages/dashboard.dart';
import 'pages/activity_log.dart';
import 'pages/user_management.dart';
import 'pages/setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardPage(),
        '/activity': (context) => const ActivityLogPage(),
        '/user': (context) => const UserManagementPage(),
        '/setting': (context) => const SettingPage(),
      },
    );
  }
}
