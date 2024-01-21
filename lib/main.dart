import 'package:client_manager/core/routes/routes.dart';
import 'package:client_manager/features/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      child: MaterialApp(
        title: 'Client Manager',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home,
        routes: AppRouter.paths,
      ),
    );
  }
}
