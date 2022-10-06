import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/user_provider.dart';

class HomeView2 extends StatelessWidget {
  const HomeView2({super.key});

  @override
  Widget build(BuildContext context) {
    final providerUser = context.read<UserProvider>().getUser;

    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(providerUser, style: Theme.of(context).textTheme.headline6),
        ));
  }
}
