import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:starlite_app/domain/entities/app_error.dart';

class ApiCallWithError{
const ApiCallWithError._();

static Future<Either<AppError,T>> call<T>(Future<T> Function() f)async{
try {
return Right(await f());
} on TimeoutException catch(e){
return  Left(AppError(AppErrorType.timeout,error: e.toString()));
} on Exception catch(e) {
return  Left(AppError(AppErrorType.database,error: e.toString()));
}
}

}