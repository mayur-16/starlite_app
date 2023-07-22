import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:starlite_app/data/models/product_model.dart';
import 'package:starlite_app/domain/entities/app_error.dart';

import '../../../../core/api_call_with_error.dart';
import '../../../../data/repositories/product_repository.dart';

part 'get_all_products_state.dart';

@injectable
class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit() : super(GetAllProductsInitial());

  void getAllProducts() async {
    // getIt<LoadingCubit>().show();
    emit(GetAllProductsLoading());
    Either<AppError, List<ProductModel>> responseData = await ApiCallWithError.call(() async {
      return await ProductRepository.getAllProducts();
    });

    responseData.fold((l) {
      emit(GetAllProductsFailed(appError: AppError(l.errorType, error: l.error)));
    }, (r) {
      emit(GetAllProductsSuccess(listofProductModel: r));
    });

    // getIt<LoadingCubit>().hide();
  }
}
