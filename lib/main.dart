import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:splitter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:splitter/features/auth/presentation/cubit/google_signin_cubit.dart';
import 'package:splitter/features/individual_split/add_friends/presentation/bloc/add_friends_bloc.dart';
import 'package:splitter/router/app_router.dart';
import 'package:splitter/service_locator.dart';

void main(List<String> args) async {
  await ServiceLocator.initialiseDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = AppRouter.router;

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GoogleSignInCubit(),
          ),
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
          BlocProvider(create: (context) => AddFriendsBloc(),)
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ));
  }
}
