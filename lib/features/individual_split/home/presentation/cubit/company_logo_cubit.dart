import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyLogoState {
  final String? selectedLogo;
  final List<Map<String, String>> filteredCompanies;

  CompanyLogoState({this.selectedLogo, this.filteredCompanies = const []});

  CompanyLogoState copyWith({
    String? selectedLogo,
    List<Map<String, String>>? filteredCompanies,
  }) {
    return CompanyLogoState(
      selectedLogo: selectedLogo ?? this.selectedLogo,
      filteredCompanies: filteredCompanies ?? this.filteredCompanies,
    );
  }
}

class CompanyLogoCubit extends Cubit<CompanyLogoState> {
  CompanyLogoCubit() : super(CompanyLogoState());

  final List<Map<String, String>> _companies = [
    {'name': 'McDonald\'s', 'logo': 'https://www.mcdonalds.com/content/dam/sites/usa/nfl/icons/arches-logo_108x108.jpg'},
    {'name': 'Walmart', 'logo': 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Walmart_logo.svg/1024px-Walmart_logo.svg.png'},
    {'name': 'Starbucks', 'logo': 'https://www.mcdonalds.com/content/dam/sites/usa/nfl/icons/arches-logo_108x108.jpg'},
  ];

  void filterCompanies(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(filteredCompanies: []));
    } else {
      final List<Map<String, String>> filtered = _companies
          .where((company) =>
              company['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(state.copyWith(filteredCompanies: filtered));
    }
  }

  void selectCompany(String name, String logo) {
    emit(state.copyWith(selectedLogo: logo, filteredCompanies: []));
  }
}
