part of 'get_all_products_cubit.dart';

abstract class GetAllProductsState extends Equatable {
  const GetAllProductsState();
}

class GetAllProductsInitial extends GetAllProductsState {
  @override
  List<Object> get props => [];
}

class GetAllProductsLoading extends GetAllProductsState {
  @override
  List<Object> get props => [];
}

class GetAllProductsSuccess extends GetAllProductsState {
  final List<ProductModel> listofProductModel;

  const GetAllProductsSuccess({required this.listofProductModel});

  @override
  List<Object> get props => [listofProductModel];
}

class GetAllProductsFailed extends GetAllProductsState {
  final AppError appError;

  const GetAllProductsFailed({required this.appError});

  @override
  List<Object> get props => [appError];
}
