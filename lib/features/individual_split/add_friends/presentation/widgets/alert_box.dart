import 'package:flutter/material.dart';
import 'package:splitter/features/individual_split/add_friends/data/model/add_friend_model.dart';
import 'package:splitter/features/individual_split/add_friends/presentation/widgets/friend_request_icon.dart';

addFriendAlertBox({
  required BuildContext context,
  required AddFriendModel profileModel,
}) {
  double h = MediaQuery.of(context).size.height;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: h * 0.33,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              friendRequestIcon(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                  'You are about to send a friend request to'),
              const SizedBox(
                height: 20,
              ),
              Text(
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                  profileModel.name),
              Text(
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400),
                  "(${profileModel.email})"),
              // SizedBox.expand(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                          "Send")),
                  const SizedBox(
                    width: 15,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          "close")),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      );
    },
  );
}