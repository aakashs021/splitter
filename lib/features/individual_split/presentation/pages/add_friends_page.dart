import 'package:flutter/material.dart';

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
            Container(
              height: 50,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: Text('A'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 70,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            'Aakash Suresh ',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              'aakashs2022sa@gmail.com'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12.5),
                        border: Border.all(color: Colors.blue)),
                    // color: Colors.black,
                    child: Center(
                      child: Icon(
                        Icons.person_add_alt_1,
                        color: Colors.white,
                        size: 27.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(
                // height: 10,
                ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    // color: Colors.red,
                    child: const CircleAvatar(
                      child: Text('A'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 70,
                      // width: 200,
                      // color: Colors.blue,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            'New Member',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text('aakashs2022sa@gmail.com'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(12.5),
                        border: Border.all(color: Colors.green)),
                    // color: Colors.black,
                    child: Center(
                      child: Icon(
                        Icons.people,
                        color: Colors.green,
                        size: 27.5,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
