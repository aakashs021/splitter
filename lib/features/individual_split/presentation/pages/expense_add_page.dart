import 'package:flutter/material.dart';
import 'package:splitter/features/individual_split/presentation/widgets/expense_add_page_widgets.dart/company_logo_text_feild.dart';

class ExpenseAddPage extends StatelessWidget {
  const ExpenseAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          CompanyLogoTextFeild(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.receipt,
                size: 75,
                color: Colors.grey.shade500,
              ),
              const SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Description'),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.currency_bitcoin,
                size: 75,
                color: Colors.grey.shade500,
              ),
              const SizedBox(
                  width: 200,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Amount'),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
