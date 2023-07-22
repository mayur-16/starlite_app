import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api_call_with_error.dart';
import '../../../../data/repositories/customer_repository.dart';
import '../../../../domain/entities/app_error.dart';
import '../../../../get_it/get_it.dart';
import '../../util_cubits/loading_cubit.dart';
import '../get_all_customers_cubit/get_all_customers_cubit.dart';

part 'add_new_customer_state.dart';

@injectable
class AddNewCustomerCubit extends Cubit<AddNewCustomerState> {
  AddNewCustomerCubit() : super(AddNewCustomerInitial());

  void addNewCustomer({required String name, String? location}) async {
    getIt<LoadingCubit>().show();
    emit(AddNewCustomerLoading());
    Either<AppError, bool> responseData = await ApiCallWithError.call(() async {
      return await CustomerRepository.addNewCustomer(name: name, location: location);
    });

    responseData.fold((l) {
      emit(AddNewCustomerFailed(appError: AppError(l.errorType, error: l.error)));
    }, (r) {
      if (r) {
        getIt<GetAllCustomersCubit>().getAllCustomers();
        emit(AddNewCustomerSuccess());
      } else {
        emit(const AddNewCustomerFailed(appError: AppError(AppErrorType.database, error: 'Something went wrong!')));
        getIt<LoadingCubit>().hide();
      }
    });
  }
}
