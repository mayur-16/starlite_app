import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starlite_app/core/navigation_service.dart';
import 'package:starlite_app/get_it/get_it.dart';
import 'package:starlite_app/presentation/cubits/util_cubits/loading_cubit.dart';
import 'package:starlite_app/presentation/routes/route_generator.dart';
import 'package:starlite_app/presentation/routes/routes.dart';
import 'package:starlite_app/presentation/theme/app_theme.dart';
import 'flavors.dart';

class StarliteApp extends StatefulWidget {
  const StarliteApp({super.key});

  @override
  State<StarliteApp> createState() => _StarliteAppState();
}

class _StarliteAppState extends State<StarliteApp> {
  late final RouteGenerator _routeGenerator;
  late GlobalKey<NavigatorState> navigationKey;

  @override
  void initState() {
    super.initState();
    _routeGenerator = getIt<RouteGenerator>();
    navigationKey = NavigationService.instance.navigationKey;
  }

  @override
  void dispose() {
    navigationKey.currentState?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> getIt<LoadingCubit>(),
      child: MaterialApp(
        title: F.title,
        theme: AppTheme.lightTheme(context),
        builder: (context, child) {
          return _flavorBanner(child: child!, show: F.appFlavor != Flavor.prod);
        },
        themeMode: ThemeMode.light,
        onGenerateRoute: _routeGenerator.generateRoute,
        navigatorKey: navigationKey,
        initialRoute: Routes.homeScreen,
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
        location: BannerLocation.topStart,
        message: F.name,
        color: Colors.green.withOpacity(0.6),
        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0, letterSpacing: 1.0),
        textDirection: TextDirection.ltr,
        child: child,
      )
          : Container(
        child: child,
      );
}
