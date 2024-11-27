import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splitter/features/auth/data/data_source/firestore_service.dart';
import 'package:splitter/features/auth/domain/usecase/google_sign_in_usecase.dart';
import 'package:splitter/service_locator.dart';

enum GoogleSignInState { initial, loading, success, failure }

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit() : super(GoogleSignInState.initial);

  Future<void> signInWithGoogle() async {
    emit(GoogleSignInState.loading);

    try {
      await GoogleSignInUsecase().call();
      bool exists =
          await ServiceLocator.sl<FirestoreService>().userExistsOrNot();
      if (exists) {
        emit(GoogleSignInState.success);
      } else {
        emit(GoogleSignInState.failure);
      }
    } catch (e) {
      emit(GoogleSignInState.failure);
    }
  }
}
