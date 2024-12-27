import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:splitter/features/auth/presentation/pages/sign_in_page.dart';
import 'package:splitter/features/auth/presentation/pages/sign_up_page.dart';
import 'package:splitter/features/individual_split/add_friends/presentation/pages/add_friends_page.dart';
import 'package:splitter/features/individual_split/detail_screen/presentation/pages/detail_page.dart';
import 'package:splitter/features/individual_split/expense_add/presentation/pages/expense_add_page.dart';
import 'package:splitter/features/individual_split/home/presentation/pages/home_page.dart';
import 'package:splitter/router/app_router_constants.dart';

class AppRouter {
  static String initalPage(){
    if(FirebaseAuth.instance.currentUser==null){
      return '/signIn';
    }else{
      return '/home';
    }
  }

  static final GoRouter router = GoRouter(
      initialLocation: initalPage(),
    routes: <RouteBase>[
    GoRoute(
      name: AppRouterConstants.signInPageRouterName,
      path: "/signIn",
      builder: (context, state) => SignInPage(),
      ),
      GoRoute(
      name: AppRouterConstants.signUpPageRouterName,
      path: "/signUp",
      builder: (context, state) =>  SignUpPage(),
      ),
      GoRoute(
        name: AppRouterConstants.homePageRouterName,
        path: '/home',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(path: '/addFriends',
            name: AppRouterConstants.addFriendsPageRouterName,
            builder: (context, state) =>  AddFriendsPage(),
            ),
            GoRoute(path: '/detail',
              name: AppRouterConstants.detailPageRouterName,
              builder: (context, state) => const DetailPage(),
              routes: [
                GoRoute(path: '/expenseApp',
                name: AppRouterConstants.expenseAddPageRouterName,
                builder: (context, state) => const ExpenseAddPage(),
                )
              ]
            )
          ]
        )
  ]);
}