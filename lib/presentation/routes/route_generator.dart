import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:starlite_app/presentation/routes/routes.dart';

import '../../get_it/get_it.dart';
import '../cubits/customer/add_new_customer_cubit/add_new_customer_cubit.dart';
import '../cubits/customer/get_all_customers_cubit/get_all_customers_cubit.dart';
import '../cubits/database/database_cubit.dart';
import '../cubits/product/add_new_product_cubit/add_new_product_cubit.dart';
import '../cubits/product/get_all_products_cubit/get_all_products_cubit.dart';
import '../screens/home_screen.dart';

@lazySingleton
class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=> getIt<DatabaseCubit>()..initializeDataBase()),
            BlocProvider(create: (context)=> getIt<AddNewCustomerCubit>()),
            BlocProvider(create: (context)=> getIt<GetAllCustomersCubit>()),
            BlocProvider(create: (context)=> getIt<AddNewProductCubit>()),
            BlocProvider(create: (context)=> getIt<GetAllProductsCubit>()),
          ],
            child: const HomeScreen(),));

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
