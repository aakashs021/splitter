import 'package:splitter/features/individual_split/add_friends/data/model/add_friend_model.dart';

abstract class AddFriendsState  {
  const AddFriendsState();

}

class AddFriendsInitial extends AddFriendsState {}

class AddFriendsLoading extends AddFriendsState {}

class AddFriendsSuccess extends AddFriendsState {
  final List<AddFriendModel> friends;

  const AddFriendsSuccess(this.friends);

}

class AddFriendsFailure extends AddFriendsState {
  final String error;

  const AddFriendsFailure(this.error);

}
class AddFriendsSuccessListIsEmpty extends AddFriendsState{}
