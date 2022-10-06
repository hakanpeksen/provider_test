import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/user_provider.dart';

import 'home_view.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: ((BuildContext context) => UserProvider()),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: HomeView(),
    );
  }
}
