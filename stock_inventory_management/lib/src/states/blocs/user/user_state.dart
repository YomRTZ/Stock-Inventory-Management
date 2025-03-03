import 'package:stock_inventory_management/src/data/model/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  final List<Datum> userData; 
  UserSuccessState(this.userData);
}

class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
}
class AddUserStateInitial extends UserState {}

class AddUserStateLoading extends UserState {}

class AddUserStateSuccess extends UserState {}

class AddUserStateErrorState extends UserState {
  final String error;

  AddUserStateErrorState(this.error);
}
