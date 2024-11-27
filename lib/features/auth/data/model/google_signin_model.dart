import 'package:splitter/features/auth/domain/entity/google_signin_entity.dart';

class GoogleSigninModel extends GoogleSigninEntity {
  GoogleSigninModel({required super.name, required super.email});
  Map<String,String> toFirebase(){
      return {"name":name,
      "email":email};
  }
  // fromFirebase({required Map<String,String> userDetail}){

  // }
}