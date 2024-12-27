abstract class UsecaseRequestFriend<Type,Params1, Params2> {
    Future<Type> call({required Params1 name,required Params2 email});

}