import 'package:flutter/material.dart';
import 'package:splitter/features/individual_split/add_friends/data/model/add_friends_profile_list_item_model.dart';

class AddFriendsProfileListItem extends StatelessWidget {
  final AddFriendModel profileModel;
  
  const AddFriendsProfileListItem({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: const Text('A'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            profileModel.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              profileModel.email),
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
                    child: const Center(
                      child: Icon(
                        Icons.person_add_alt_1,
                        color: Colors.white,
                        size: 27.5,
                      ),
                    ),
                  ),
                ],
              ),
            );
  }
}
//  Container(
//               height: 50,
//               child: Row(
//                 children: [
//                   Container(
//                     height: 50,
//                     width: 50,
//                     // color: Colors.red,
//                     child: const CircleAvatar(
//                       child: Text('A'),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                     child: Container(
//                       height: 70,
//                       // width: 200,
//                       // color: Colors.blue,
//                       child: const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.w500),
//                             'New Member',
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           Text('aakashs2022sa@gmail.com'),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                         // color: Colors.blue,
//                         borderRadius: BorderRadius.circular(12.5),
//                         border: Border.all(color: Colors.green)),
//                     // color: Colors.black,
//                     child: Center(
//                       child: Icon(
//                         Icons.people,
//                         color: Colors.green,
//                         size: 27.5,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )