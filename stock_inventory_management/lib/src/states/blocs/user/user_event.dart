import 'package:stock_inventory_management/src/data/model/user_model.dart';

class UserEvent {}
class GetUserEvent extends UserEvent {}
class AddUserEvent extends UserEvent {
  final Datum user;

  AddUserEvent({required this.user});
}