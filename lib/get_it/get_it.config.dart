// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../presentation/cubits/customer/add_new_customer_cubit/add_new_customer_cubit.dart'
    as _i3;
import '../presentation/cubits/customer/get_all_customers_cubit/get_all_customers_cubit.dart'
    as _i6;
import '../presentation/cubits/database/database_cubit.dart' as _i5;
import '../presentation/cubits/product/add_new_product_cubit/add_new_product_cubit.dart'
    as _i4;
import '../presentation/cubits/product/get_all_products_cubit/get_all_products_cubit.dart'
    as _i7;
import '../presentation/cubits/util_cubits/loading_cubit.dart' as _i8;
import '../presentation/routes/route_generator.dart' as _i9;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AddNewCustomerCubit>(() => _i3.AddNewCustomerCubit());
  gh.factory<_i4.AddNewProductCubit>(() => _i4.AddNewProductCubit());
  gh.factory<_i5.DatabaseCubit>(() => _i5.DatabaseCubit());
  gh.factory<_i6.GetAllCustomersCubit>(() => _i6.GetAllCustomersCubit());
  gh.factory<_i7.GetAllProductsCubit>(() => _i7.GetAllProductsCubit());
  gh.lazySingleton<_i8.LoadingCubit>(() => _i8.LoadingCubit());
  gh.lazySingleton<_i9.RouteGenerator>(() => _i9.RouteGenerator());
  return getIt;
}
