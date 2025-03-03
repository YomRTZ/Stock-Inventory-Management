import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_inventory_management/src/bussiness/user_repository.dart';
import 'package:stock_inventory_management/src/states/blocs/user/user_event.dart';
import 'package:stock_inventory_management/src/states/blocs/user/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserInitialState()) {
    on<GetUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final response = await userRepository.getUser();
        if (response.isNotEmpty) {
          emit(UserSuccessState(response));
        } else {
          emit(UserErrorState("user not found"));
        }
      } catch (error) {
        emit(UserErrorState("error ${error.toString()}"));
      }
    });
    on<AddUserEvent>((event, emit) async {
      emit(AddUserStateLoading());
      try {
        await userRepository.createUser(event.user);
        emit(AddUserStateSuccess());
      } catch (e) {
        emit(AddUserStateErrorState("Failed to add user. ${e.toString()}"));
      }
    });
  }
}
