import 'package:dartz/dartz.dart';
import 'package:splitter/features/individual_split/add_friends/data/model/add_friend_model.dart';

abstract class FriendsRepository {
  // Future getUsers();
  Future<Either<String,String>> requestFriend({required String name,required String email});
  Future<Either<String,List<AddFriendModel>>> searchFriends({required String query});
}