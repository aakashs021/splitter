import 'package:dartz/dartz.dart';
import 'package:splitter/core/usecase/auth_usecases/usecase.dart';
import 'package:splitter/features/auth/data/model/user_signin_model.dart';
import 'package:splitter/features/auth/domain/repostiory/auth_repository.dart';
import 'package:splitter/service_locator.dart';

class SignInUsecase implements Usecase<Either<String,String>,UserSigninModel>{
  @override
  Future<Either<String,String>> call({required params}) async{
   Either<String,String> result= await ServiceLocator.sl<AuthRepository>().signIn(userModel: params);
   return result;
  }
}