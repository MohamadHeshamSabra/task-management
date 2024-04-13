import 'package:flutter/material.dart';
import 'package:task_manager_app/core/local_db.dart';
import 'package:task_manager_app/core/utils/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDb().db;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
