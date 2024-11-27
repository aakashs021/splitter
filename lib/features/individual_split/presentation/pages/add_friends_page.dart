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
                            'Aakash Suresh lkadsjejlkdroejflkmcmcxlkklfdjlkflkj',
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
                    width: 70,
                    // color: Colors.black,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       
                      ],
                    ),
                  ),
                ],
              ),
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
                            'Aakash Suresh lkadsjejlkdroejflkmcmcxlkklfdjlkflkj',
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
                    width: 70,
                    // color: Colors.black,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       
                      ],
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
