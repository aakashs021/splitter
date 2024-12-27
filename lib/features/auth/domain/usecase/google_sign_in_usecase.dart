import 'package:dartz/dartz.dart';
import 'package:splitter/core/usecase/auth_usecases/usecase_other.dart';
import 'package:splitter/features/auth/domain/repostiory/auth_repository.dart';
import 'package:splitter/service_locator.dart';

class GoogleSignInUsecase implements UsecaseOther<Either<String,String>>{
  @override
  Future<Either<String, String>> call() async{
    Either<String,String> result =await ServiceLocator.sl<AuthRepository>().googleSignIn();
    return result;
  }
}