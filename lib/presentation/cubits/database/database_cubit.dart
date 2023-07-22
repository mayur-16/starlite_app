import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api_call_with_error.dart';
import '../../../core/local_db_client.dart';
import '../../../domain/entities/app_error.dart';
import '../../../get_it/get_it.dart';
import '../util_cubits/loading_cubit.dart';

part 'database_state.dart';

@injectable
class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(DatabaseInitial());

  /// initialize database
  void initializeDataBase() async {
    getIt<LoadingCubit>().show();
    emit(DatabaseInitializationLoading());
    Either<AppError, bool> responseData = await ApiCallWithError.call(() async {
      await LocalDataBaseClient.initializeDataBase();
      return true;
    });

    responseData.fold((l) {
      emit(DatabaseInitializationFailed(appError: AppError(l.errorType, error: l.error)));
    }, (r) {
      emit(DatabaseInitializationSuccess());
    });

    getIt<LoadingCubit>().hide();
  }
}
