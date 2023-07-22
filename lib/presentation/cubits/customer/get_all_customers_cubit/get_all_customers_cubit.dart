import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:starlite_app/data/repositories/customer_repository.dart';

import '../../../../core/api_call_with_error.dart';
import '../../../../data/models/customer_model.dart';
import '../../../../domain/entities/app_error.dart';
import '../../../../get_it/get_it.dart';
import '../../util_cubits/loading_cubit.dart';

part 'get_all_customers_state.dart';

@injectable
class GetAllCustomersCubit extends Cubit<GetAllCustomersState> {
  GetAllCustomersCubit() : super(GetAllCustomersInitial());

  void getAllCustomers() async {
    getIt<LoadingCubit>().show();
    emit(GetAllCustomersLoading());
    Either<AppError, List<CustomerModel>> responseData = await ApiCallWithError.call(() async {
      return await CustomerRepository.getAllCustomers();
    });

    responseData.fold((l) {
      emit(GetAllCustomersFailed(appError: AppError(l.errorType, error: l.error)));
    }, (r) {
      emit(GetAllCustomersSuccess(listofCustomerModel: r));
    });
    getIt<LoadingCubit>().hide();
  }
}
