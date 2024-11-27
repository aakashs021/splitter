import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splitter/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:splitter/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:splitter/features/auth/presentation/bloc/auth_event.dart';
import 'package:splitter/features/auth/presentation/bloc/auth_state.dart';
import 'package:splitter/service_locator.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
  }
  _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      Either<String, String> result = await ServiceLocator.sl<SignInUsecase>()
          .call(params: event.userModel);
      _handleResult(result, emit, true);
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      print('start');
      Either<String, String> result = await ServiceLocator.sl<SignUpUsecase>()
          .call(params: event.userModel);
      _handleResult(result, emit, false);
      print('stop');
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  _handleResult(Either<String, String> result, Emitter<AuthState> emit,
      bool signChecker) {
    result.fold(
      (failure) => emit(AuthFailure(errorMessage: failure)),
      (success) => emit(AuthSuccess(message: success, isLogin: signChecker)),
    );
  }
}
