import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:splitter/features/individual_split/add_friends/domain/entity/add_friend_entity.dart';

class AddFriendModel extends AddFriendEntity{
  AddFriendModel({required super.name, required super.email,super.isFriend});

   Map<String,String> toJson(){
    return {
      'name':name,
      'email':email
    };
  }
   toFriendsJson(){
    return {
      'friends': FieldValue.arrayUnion([toJson()])
    };
  }
}