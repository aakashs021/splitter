import 'package:dartz/dartz.dart';
import 'package:splitter/core/usecase/usecase_other.dart';
import 'package:splitter/features/auth/domain/repostiory/auth_repository.dart';
import 'package:splitter/service_locator.dart';

class SignOutUsecase implements UsecaseOther<Either<String,String>>{
  @override
  Future<Either<String,String>> call()async {
   Either<String,String> result = ServiceLocator.sl<AuthRepository>().signOut();
   return result;
  }
}