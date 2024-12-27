import 'package:dartz/dartz.dart';
import 'package:splitter/core/usecase/auth_usecases/usecase.dart';
import 'package:splitter/features/auth/data/model/user_signup_model.dart';
import 'package:splitter/features/auth/domain/repostiory/auth_repository.dart';
import 'package:splitter/service_locator.dart';

class SignUpUsecase
    implements Usecase<Either<String, String>, UserSignupModel> {
  @override
  Future<Either<String, String>> call({required UserSignupModel params}) async {
    print('signup usecase');
    Either<String, String> result =
        await ServiceLocator.sl<AuthRepository>().signUp(userModel: params);
    print('next');
    return result;
  }
}
