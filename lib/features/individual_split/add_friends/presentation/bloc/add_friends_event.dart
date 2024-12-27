abstract class AddFriendsEvent {
  const AddFriendsEvent();
}

class SearchFriendsEvent extends AddFriendsEvent {
  final String query;

  const SearchFriendsEvent(this.query);
}
class ResetSearchEvent extends AddFriendsEvent {}
