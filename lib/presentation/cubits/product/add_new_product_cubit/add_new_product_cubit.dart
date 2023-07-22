import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api_call_with_error.dart';
import '../../../../data/repositories/product_repository.dart';
import '../../../../domain/entities/app_error.dart';
import '../../../../get_it/get_it.dart';
import '../../util_cubits/loading_cubit.dart';
import '../get_all_products_cubit/get_all_products_cubit.dart';

part 'add_new_product_state.dart';

@injectable
class AddNewProductCubit extends Cubit<AddNewProductState> {
  AddNewProductCubit() : super(AddNewProductInitial());

  void addNewProduct({required String name, String? description, required int stock, required int price}) async {
    getIt<LoadingCubit>().show();
    emit(AddNewProductLoading());
    Either<AppError, bool> responseData = await ApiCallWithError.call(() async {
      return await ProductRepository.addNewProduct(name: name, price: price, stock: stock);
    });

    responseData.fold((l) {
      emit(AddNewProductFailed(appError: AppError(l.errorType, error: l.error)));
    }, (r) {
      if (r) {
        emit(AddNewProductSuccess());
        getIt<GetAllProductsCubit>().getAllProducts();
      } else {
        emit(const AddNewProductFailed(appError: AppError(AppErrorType.database, error: 'Something went wrong!')));

        // hide loader only when api failed because on success were triggering another api so no use...
        // getIt<LoadingCubit>().hide();
      }
    });
    getIt<LoadingCubit>().hide();
  }
}
