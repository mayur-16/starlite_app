part of 'get_all_customers_cubit.dart';

abstract class GetAllCustomersState extends Equatable {
  const GetAllCustomersState();
}

class GetAllCustomersInitial extends GetAllCustomersState {
  @override
  List<Object> get props => [];
}


class GetAllCustomersLoading extends GetAllCustomersState {
  @override
  List<Object> get props => [];
}

class GetAllCustomersSuccess extends GetAllCustomersState {
  final List<CustomerModel> listofCustomerModel;

  const GetAllCustomersSuccess({required this.listofCustomerModel});

  @override
  List<Object> get props => [listofCustomerModel];
}


class GetAllCustomersFailed extends GetAllCustomersState {
  final AppError appError;
  const GetAllCustomersFailed({required this.appError});
  @override
  List<Object> get props => [appError];
}