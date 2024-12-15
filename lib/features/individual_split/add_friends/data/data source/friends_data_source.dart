import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FriendsDataSource {
 Future searchFriends({required String query});
 Future addFriends();
}

class FriendsDataSourceImpl implements FriendsDataSource{
  static final fireStore = FirebaseFirestore.instance.collection("friends");
  @override
  Future searchFriends({required String query}) async{
       var result = await fireStore.get();
      List resultList = result.docs;
      
  }
  
  @override
  Future addFriends() {
    // TODO: implement addFriends
    throw UnimplementedError();
  }

}