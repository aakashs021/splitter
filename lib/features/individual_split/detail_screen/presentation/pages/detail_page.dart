import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitter/router/app_router_constants.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aakash Suresh'),
        bottom: PreferredSize(
            preferredSize: Size(double.infinity, 20),
            child: Text('aakashs2021sa@gmail.com')),
      ),
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).pushNamed(AppRouterConstants.expenseAddPageRouterName);
        },
        child: Text('Add expense'),
      ),
    );
  }
}
