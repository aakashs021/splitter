import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splitter/features/individual_split/home/presentation/cubit/company_logo_cubit.dart';

class CompanyLogoTextFeild extends StatelessWidget {
  const CompanyLogoTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return BlocProvider(
      create: (_) => CompanyLogoCubit(),
      child: BlocBuilder<CompanyLogoCubit, CompanyLogoState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  state.selectedLogo != null
                      ? Image.network(
                          state.selectedLogo!,
                          height: 60,
                          width: 60,
                        )
                      : Icon(
                          Icons.location_on_sharp,
                          size: 60,
                          color: Colors.grey.shade500,
                        ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Company Name (Optional)',
                      ),
                      onChanged: (value) {
                        context.read<CompanyLogoCubit>().filterCompanies(value);
                      },
                    ),
                  ),
                ],
              ),
              if (state.filteredCompanies.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 260,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.filteredCompanies.length,
                    itemBuilder: (context, index) {
                      final company = state.filteredCompanies[index];
                      return ListTile(
                        leading: Image.network(
                          company['logo']!,
                          height: 40,
                          width: 40,
                        ),
                        title: Text(company['name']!),
                        onTap: () {
                          context.read<CompanyLogoCubit>().selectCompany(
                                company['name']!,
                                company['logo']!,
                              );
                          _controller.text = company['name']!;
                        },
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
