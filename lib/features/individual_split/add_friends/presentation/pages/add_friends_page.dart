import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splitter/features/auth/presentation/widgets/loading_indicator.dart';
import 'package:splitter/features/individual_split/add_friends/presentation/bloc/add_friends_bloc.dart';
import 'package:splitter/features/individual_split/add_friends/presentation/bloc/add_friends_event.dart';
import 'package:splitter/features/individual_split/add_friends/presentation/bloc/add_friends_state.dart';
import 'package:splitter/features/individual_split/add_friends/presentation/widgets/add_friends_profile_list_item.dart';

class AddFriendsPage extends StatelessWidget {
  AddFriendsPage({super.key});
  final TextEditingController searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Friends'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search new friends',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                onChanged: (value) {
                  if(value.isEmpty){
                    context.read<AddFriendsBloc>().add(ResetSearchEvent());
                  }
                  if (_debounceTimer?.isActive ?? false) {
                    _debounceTimer?.cancel();
                  }

                  _debounceTimer = Timer(const Duration(milliseconds: 500), () {
                    if (value.isNotEmpty) {
                      context.read<AddFriendsBloc>().add(SearchFriendsEvent(value));
                    }
                  });
                },
              ),
              const SizedBox(height: 10),
              BlocBuilder<AddFriendsBloc, AddFriendsState>(
                builder: (context, state) {
                  if (state is AddFriendsInitial) {
                    return const Center(child: Text('Start searching for friends.'));
                  }
                  if (state is AddFriendsLoading) {
                    return  Center(child: loadingIndicator());
                  }
                  if (state is AddFriendsFailure) {
                    return Center(
                      child: Text('Error: ${state.error}', style: TextStyle(color: Colors.red)),
                    );
                  }
                  if (state is AddFriendsSuccessListIsEmpty) {
                    return const Center(child: Text('No friends found.'));
                  }
                  if (state is AddFriendsSuccess) {
                    final data = state.friends;
                    return data.isEmpty
                        ? const Center(child: Text('No friends found.'))
                        : ListView.separated(
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return AddFriendsProfileListItem(
                                profileModel: data[index],
                              );
                            },
                            separatorBuilder: (context, index) => const Divider(),
                          );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
