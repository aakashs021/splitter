import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:splitter/features/individual_split/add_friends/data/model/add_friend_model.dart';
import 'package:splitter/features/individual_split/add_friends/data/model/add_friend_request_model.dart';

abstract class FriendsDataSource {
  Future<List<AddFriendModel>> searchFriends({required String query});
  Future<String> addFriends({required String name, required String email});
  Future<List<AddFriendModel>> getUsers();
  Future requestFriend({required String name,required String email});
  Future declineFriendRequest();
}

class FriendsDataSourceImpl implements FriendsDataSource {
  static final fireStoreUsers = FirebaseFirestore.instance.collection("users");
  static final fireStoreUserRequest = FirebaseFirestore.instance.collection('requests');
  static final fireStoreUserFriends = FirebaseFirestore.instance.collection('friends');

  @override
  Future<List<AddFriendModel>> getUsers() async {
    try {
      QuerySnapshot result = await fireStoreUsers.get();
      List<QueryDocumentSnapshot> resultList = result.docs;
      List<AddFriendModel> friendsList = [];
      if (resultList.isNotEmpty) {
        String currentUser = FirebaseAuth.instance.currentUser!.email!;

        for (var doc in resultList) {
          if (currentUser == doc.id) {
            continue;
          }
          String name = doc['name'] ?? '';
          String email = doc['email'] ?? '';
          friendsList.add(AddFriendModel(name: name, email: email));
        }
      }
      return friendsList;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<AddFriendModel>> searchFriends({required String query}) async {
     try {
      if(query.isEmpty){
        return [];
      }
    List<AddFriendModel> friendsList = await getUsers();

    List<AddFriendModel> filteredList = friendsList.where((friend) {
      final lowerQuery = query.toLowerCase();
      return friend.name.toLowerCase().contains(lowerQuery) ||
             friend.email.toLowerCase().contains(lowerQuery);
    }).toList();

    filteredList.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    return filteredList;
  } catch (e) {
    throw Exception('Error searching friends: $e');
  }
  }

  @override
  Future<String> addFriends({required String name, required String email}) async {
    try {
      AddFriendModel friendModel = AddFriendModel(
        name: name,
        email: email,
      );
      String currentUser = FirebaseAuth.instance.currentUser!.email!;
      fireStoreUserRequest.doc(currentUser).update(friendModel.toFriendsJson());
      return "Added as friend successfully";
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
  @override
  Future requestFriend({required String name,required String email}) async{
    try{
    AddFriendRequestModel friendModel = AddFriendRequestModel(
        name: name,
        email: email,
        dateTime: DateTime.now()
      );
    String currentUser = FirebaseAuth.instance.currentUser!.email!;
    fireStoreUserFriends.doc(currentUser).update(friendModel.toRequstJson());
    return "Request sent successfully";
    }on Exception catch (e){
      throw Exception(e);
    }
  }
  
  @override
  Future declineFriendRequest() {
    // TODO: implement declineFriendRequest
    throw UnimplementedError();
  }
  
}
