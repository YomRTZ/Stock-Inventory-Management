import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_inventory_management/src/bussiness/customer_repository.dart';
import 'package:stock_inventory_management/src/states/blocs/customer/customer_event.dart';
import 'package:stock_inventory_management/src/states/blocs/customer/customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;
  CustomerBloc({required this.customerRepository})
      : super(CustomerInitialState()) {
    on<GetCustomerEvent>((event, emit) async {
      emit(CustomerLoadingState());
      try {
        final response = await customerRepository.getCustomer();
        if (response.isNotEmpty) {
          emit(CustomerSuccessState(response));
        } else {
          emit(CustomerErrorState("customer not found"));
        }
      } catch (error) {
        emit(CustomerErrorState("error ${error.toString()}"));
      }
    });
    on<AddCustomerEvant>((event, emit) async {
      emit(AddCustomerStateLoading());
      try {
        await customerRepository.createCustomer(event.data);
        emit(AddCustomerStateSuccess());
      } catch (e) {
        emit(AddCustomerStateErrorState(
            "Failed to add customer. ${e.toString()}"));
      }
    });
  }
}
