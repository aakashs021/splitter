import 'package:dartz/dartz.dart';
import 'package:splitter/features/individual_split/add_friends/data/data%20source/friends_data_source.dart';
import 'package:splitter/features/individual_split/add_friends/data/model/add_friend_model.dart';
import 'package:splitter/features/individual_split/add_friends/domain/repository/friends_repository.dart';
import 'package:splitter/service_locator.dart';

class FriendsRepositoryImpl implements FriendsRepository{
  var friendsInstance = ServiceLocator.sl<FriendsDataSource>();
  // @override
  // Future<Either<String,List<AddFriendModel>>> getUsers()async {
  //  try{
  //   List<AddFriendModel> result =await friendsInstance.getUsers();
  //   return right(result);
  //  }catch (e){
  //   return left(e.toString());
  //  }
  // }

  @override
  Future<Either<String,String>> requestFriend({required String name,required String email}) async{
    try{
   String result =await friendsInstance.requestFriend(name: name, email: email);
   return right(result);
    }catch (e){
      return left(e.toString());
    }
  }

  @override
  Future<Either<String,List<AddFriendModel>>> searchFriends({required String query}) async{
    try{
     List<AddFriendModel> result = await friendsInstance.searchFriends(query: query);
     return right(result);
    }catch (e){
     return left(e.toString());
    }
  }
}