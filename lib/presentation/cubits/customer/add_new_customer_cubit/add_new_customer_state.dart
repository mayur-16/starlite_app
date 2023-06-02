part of 'add_new_customer_cubit.dart';

abstract class AddNewCustomerState extends Equatable {
  const AddNewCustomerState();
}

class AddNewCustomerInitial extends AddNewCustomerState {
  @override
  List<Object> get props => [];
}


class AddNewCustomerLoading extends AddNewCustomerState {
  @override
  List<Object> get props => [];
}

class AddNewCustomerSuccess extends AddNewCustomerState {
  @override
  List<Object> get props => [];
}

class AddNewCustomerFailed extends AddNewCustomerState {
  final AppError appError;
  const AddNewCustomerFailed({required this.appError});
  @override
  List<Object> get props => [appError];
}