import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:splitter/features/auth/data/data_source/auth_firebase_service.dart';
import 'package:splitter/features/auth/data/data_source/firestore_service.dart';
import 'package:splitter/features/auth/data/repository/auth_repository_impl.dart';
import 'package:splitter/features/auth/domain/repostiory/auth_repository.dart';
import 'package:splitter/features/auth/domain/usecase/google_sign_in_usecase.dart';
import 'package:splitter/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:splitter/features/auth/domain/usecase/sign_out_usecase.dart';
import 'package:splitter/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:splitter/features/individual_split/add_friends/data/data%20source/friends_data_source.dart';
import 'package:splitter/features/individual_split/add_friends/data/repository/friends_repository_impl.dart';
import 'package:splitter/features/individual_split/add_friends/domain/repository/friends_repository.dart';
import 'package:splitter/features/individual_split/add_friends/domain/usecase/request_friend_usecase.dart';
import 'package:splitter/features/individual_split/add_friends/domain/usecase/search_friend_usecase.dart';
import 'package:splitter/firebase_options.dart';

class ServiceLocator {
  static final sl=GetIt.instance;
  static Future initialiseDependencies()async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
    sl.registerLazySingleton<AuthFirebaseService>(()=>AuthFirebaseServiceImpl());
    sl.registerLazySingleton<FirestoreService>(()=>FirestoreServiceImpl());
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(),);
    sl.registerLazySingleton<SignInUsecase>(() => SignInUsecase(),);
    sl.registerLazySingleton<SignOutUsecase>(() => SignOutUsecase(),);
    sl.registerLazySingleton<SignUpUsecase>(() => SignUpUsecase(),);
    sl.registerLazySingleton<GoogleSignInUsecase>(() => GoogleSignInUsecase(),);
    sl.registerLazySingleton<FriendsDataSource>(() => FriendsDataSourceImpl(),);
    sl.registerLazySingleton<FriendsRepository>(() => FriendsRepositoryImpl(),);
    sl.registerLazySingleton<RequestFriendUsecase>(() => RequestFriendUsecase(),);
    sl.registerLazySingleton<SearchFriendUsecase>(() => SearchFriendUsecase(),);
  }
}