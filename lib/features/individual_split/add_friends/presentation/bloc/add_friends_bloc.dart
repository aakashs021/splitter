import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:splitter/features/individual_split/add_friends/domain/usecase/search_friend_usecase.dart';
import 'package:splitter/features/individual_split/add_friends/data/model/add_friend_model.dart';
import 'package:splitter/features/individual_split/add_friends/presentation/bloc/add_friends_event.dart';
import 'package:splitter/features/individual_split/add_friends/presentation/bloc/add_friends_state.dart';
import 'package:splitter/service_locator.dart';

class AddFriendsBloc extends Bloc<AddFriendsEvent, AddFriendsState> {
  AddFriendsBloc() : super(AddFriendsInitial()){
    on<SearchFriendsEvent>(_onSearch); 
     on<ResetSearchEvent>(_onResetSearch);
  }

  _onSearch(SearchFriendsEvent event, Emitter<AddFriendsState> emit) async {
    emit(AddFriendsLoading());
    Either<String, List<AddFriendModel>> result = await ServiceLocator.sl<SearchFriendUsecase>().call(query: event.query);
    result.fold(
      (l) => emit(AddFriendsFailure(l)),
      (r) {
        if(r.isEmpty){
          emit(AddFriendsSuccessListIsEmpty());
        }else{
       emit(AddFriendsSuccess(r));
        }
      }
    );
  }

   _onResetSearch(ResetSearchEvent event, Emitter<AddFriendsState> emit) {
    emit(AddFriendsInitial()); // Reset to initial state
  }
}

