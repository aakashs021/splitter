import 'package:flutter/material.dart';
import 'package:splitter/features/individual_split/add_friends/presentation/widgets/add_friends_profile_list_item.dart';

class AddFriendsPage extends StatelessWidget {
  const AddFriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Search new friends',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 10,
            ),
            // AddFriendsProfileListItem(profileModel: profileModel),
            Divider(),
            SizedBox(
                // height: 10,
                ),
           
          ],
        ),
      )),
    );
  }
}
