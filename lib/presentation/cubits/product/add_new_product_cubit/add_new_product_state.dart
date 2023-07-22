part of 'add_new_product_cubit.dart';

abstract class AddNewProductState extends Equatable {
  const AddNewProductState();
}

class AddNewProductInitial extends AddNewProductState {
  @override
  List<Object> get props => [];
}

class AddNewProductLoading extends AddNewProductState {
  @override
  List<Object> get props => [];
}

class AddNewProductSuccess extends AddNewProductState {
  @override
  List<Object> get props => [];
}

class AddNewProductFailed extends AddNewProductState {
  final AppError appError;

  const AddNewProductFailed({required this.appError});

  @override
  List<Object> get props => [appError];
}
