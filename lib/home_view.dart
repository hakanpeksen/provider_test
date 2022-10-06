import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider_test/user_provider.dart';
import 'package:provider_test/user_service.dart';
import 'package:provider/provider.dart';

import 'home_view2.dart';
import 'model/user.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final UserService userService;
  final controller = TextEditingController();

  List<User> users = [];

  int tempId = 1;

  @override
  void initState() {
    userService = UserService(Dio());
    fetchUser(tempId);
    super.initState();
  }

  Future<void> fetchUser(int id) async {
    final response = await userService.fetchUser();
    if (response == null) return;

    if (mounted) {
      // save List
      context.read<UserProvider>().saveResponse(response);
      // get List
      User firstUser = context.read<UserProvider>().getUsers.firstWhere((element) => element.id == id);

// save obj
      context.read<UserProvider>().saveUser(firstUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    final providerUser = context.watch<UserProvider>().getUser;

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text(providerUser, style: Theme.of(context).textTheme.headline6)),

            TextField(
              controller: controller,
            ),
            IconButton(
                onPressed: () async {
                  await fetchUser(int.parse(controller.text));
                  if (mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => const HomeView2()),
                    );
                  }
                },
                icon: const Icon(Icons.arrow_right)),
            // Center(
            //     child: firstUser != null
            //         ? Text(
            //             firstUser!.title ?? '',
            //           )
            //         : null),
          ],
        ),
      ),
    );
  }
}
