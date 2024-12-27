import 'package:dartz/dartz.dart';
import 'package:splitter/core/usecase/add_friends_usecases/usecase_request_friend.dart';
import 'package:splitter/features/individual_split/add_friends/domain/repository/friends_repository.dart';
import 'package:splitter/service_locator.dart';

class RequestFriendUsecase implements UsecaseRequestFriend<Either<String,String>,String,String>{
  @override
  Future<Either<String,String>> call({required name,required email}) async{
    
   Either<String,String> result =await ServiceLocator.sl<FriendsRepository>().requestFriend(name: name, email: email);
   return result;
  }

}