import 'package:flutter/material.dart';
import 'package:phone/Api/user_api.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  //late Future<User> user;
  late Future<List<dynamic>> userLists;

  @override
  void initState() {
    super.initState();
    //user = UserApi().fetchUser();
    userLists = UserApi().fetchAllUsers();

    debugPrint("api fetched...");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userLists,
      builder: (BuildContext context, AsyncSnapshot spanshot) {
        if (spanshot.hasData) {
          final List<dynamic> allUsers = spanshot.data;

          return Expanded(
            child: GestureDetector(
              onTap: () => debugPrint(spanshot.toString()),
              child: Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 100,
                    itemBuilder: ((context, index) {
                      final currentUser = allUsers[index];
                      return Card(
                        margin: const EdgeInsets.all(4),
                        color: Colors.grey[50],
                        child: ListTile(
                          title: Text(currentUser["name"] +
                              " " +
                              currentUser["surname"]),
                          subtitle: Text(currentUser["description"]
                              .toString()
                              .toLowerCase()),
                        ),
                      );
                    })),
              ),
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
