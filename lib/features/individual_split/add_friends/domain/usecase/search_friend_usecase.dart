import 'package:dartz/dartz.dart';
import 'package:splitter/core/usecase/add_friends_usecases/usecase_search_friends.dart';
import 'package:splitter/features/individual_split/add_friends/data/model/add_friend_model.dart';
import 'package:splitter/features/individual_split/add_friends/domain/repository/friends_repository.dart';
import 'package:splitter/service_locator.dart';

class SearchFriendUsecase implements UsecaseSearchFriends<Either<String,List<AddFriendModel>>,String>{
  @override
  Future<Either<String,List<AddFriendModel>>> call({required String query}) async{
   Either<String,List<AddFriendModel>> result= await ServiceLocator.sl<FriendsRepository>().searchFriends(query: query);
   return result;
  }
}