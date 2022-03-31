import 'package:flutter/material.dart';
import 'package:phone/Api/user_api.dart';

import '../Models/user.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  //late Future<User> user;
  late Future<List<dynamic>> userLists;

  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    //user = UserApi().fetchUser();
    userLists = UserApi().fetchAllUsers();
    users = UserApi().fetchUsers();
    debugPrint("api fetched...");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: users,
      builder: (BuildContext context, AsyncSnapshot spanshot) {
        if (spanshot.hasData) {
          final List<User> allUsers = spanshot.data;

          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: allUsers.length,
              itemBuilder: ((context, index) {
                final currentUser = allUsers[index];
                return GestureDetector(
                  onTap: () => debugPrint(currentUser.toString()),
                  child: Card(
                    margin: const EdgeInsets.all(0.8),
                    color: Colors.grey[50],
                    child: ListTile(
                      horizontalTitleGap: 0,
                      title: Text(
                        currentUser.fullName,
                        style: const TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                        currentUser.phone.toString(),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                );
              }));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
