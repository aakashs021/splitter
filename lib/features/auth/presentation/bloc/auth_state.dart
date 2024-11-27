class AuthState {}

class AuthInitial extends AuthState{}

class AuthLoading extends AuthState{}

class AuthSuccess extends AuthState{
  bool isLogin;
  String message;
  AuthSuccess({required this.message,this.isLogin=false});
}

class AuthFailure extends AuthState{
  String errorMessage;
  AuthFailure({required this.errorMessage});
}