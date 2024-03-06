import 'package:flutter/material.dart';
import '../Hive databse/Databox.dart';
import '../Hive databse/data record.dart';
import 'detail info.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    // Ensure that Hive is initialized and the necessary box is opened
    DataBox.getHiveFunction();
  }

  void searchUsers(String query) {
    // Perform your search logic here and update the filteredUsers list
    // For example, search based on the user's name
    List<String> allUsers =
        DataBox.dataRecordBox().keys.cast<String>().toList();
    filteredUsers = allUsers.where((userKey) {
      Person user = DataBox.dataRecordBox().get(userKey) as Person;
      return user.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  void showUserDetails(String userKey) {
    Person user = DataBox.dataRecordBox().get(userKey) as Person;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailsScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Form(
          child: Card(
            child: TextFormField(
              controller: searchController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
              ),
              onChanged: (query) {
                setState(() {
                  searchUsers(query);
                });
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredUsers.length,
        itemBuilder: (context, index) {
          String userKey = filteredUsers[index];
          Person user = DataBox.dataRecordBox().get(userKey) as Person;

          return ListTile(
            title: Text(user.name ?? ''),
            onTap: () {
              showUserDetails(userKey);
            },
          );
        },
      ),
    );
  }
}
