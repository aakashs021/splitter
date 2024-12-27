import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:splitter/features/individual_split/add_friends/domain/entity/add_friend_request_entity.dart';

class AddFriendRequestModel extends AddFriendRequestEntity{
  AddFriendRequestModel({required super.name, required super.email, required super.dateTime});

 Map<String,String> toJson(){
    return {
      'name':name,
      'email':email,
      'time':dateTime.microsecondsSinceEpoch.toString()
    };
  }

  toRequstJson(){
    return {
      'request':FieldValue.arrayUnion([toJson()])
    };
  }
}