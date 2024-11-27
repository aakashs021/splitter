import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitter/features/auth/domain/usecase/sign_out_usecase.dart';
import 'package:splitter/router/app_router_constants.dart';
import 'package:splitter/service_locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).pushNamed(AppRouterConstants.addFriendsPageRouterName);
        },
        child: const Icon(Icons.person_add_alt),
      ),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.black26,
                );
              },
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
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
                            Text('Owes'),
                            Text(
                              "#100000",
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
                // return ListTile(
                // leading: CircleAvatar(
                //   child: Text('A'),
                // ),
                //   title: Text('Aakash Suresh'),
                //   subtitle: Text('aakashs2022sa@gmail.com'),
                // trailing: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [Text('Owes'), Text("#10")],
                // ),
                // );
              },
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      // body: SafeArea(child: ),
    );
  }
}
// ElevatedButton(
//           onPressed: () {
//             ServiceLocator.sl<SignOutUsecase>().call();
//             GoRouter.of(context)
//                 .goNamed(AppRouterConstants.signInPageRouterName);
//           },
//           child: Text('data'))