import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starlite_app/gen/assets.gen.dart';
import 'package:starlite_app/presentation/screens/loading_screen.dart';

import '../../common/utils.dart';
import '../cubits/database/database_cubit.dart';
import '../cubits/product/add_new_product_cubit/add_new_product_cubit.dart';
import '../cubits/product/get_all_products_cubit/get_all_products_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      child: Scaffold(
        appBar: AppBar(
          title: Assets.appIcons.starliteLogo.image(height: 50, width: 80),
        ),
        drawer: const Drawer(),
        body: BlocConsumer<DatabaseCubit, DatabaseState>(
          listener: (_, state) {
            if (state is DatabaseInitializationFailed) {
              Utils.showSnackBar('Database Initialization Failed');
            }
            if (state is DatabaseInitializationSuccess) {
              context.read<GetAllProductsCubit>().getAllProducts();
            }
          },
          builder: (context, state) {
            if (state is DatabaseInitializationSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BlocBuilder<GetAllProductsCubit, GetAllProductsState>(builder: (context, state) {
                    if (state is GetAllProductsSuccess) {
                      return ListView.builder(
                          itemCount: state.listofProductModel.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text('${state.listofProductModel[index].id}'),
                              title: Text(state.listofProductModel[index].name),
                              trailing: Text('${state.listofProductModel[index].price}'),
                            );
                          });
                    }
                    if (state is GetAllProductsFailed) {
                      return Text("Failed ${state.appError.error}");
                    }
                    return const CircularProgressIndicator();
                  }),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Add Product'),
          onPressed: () {
            context.read<AddNewProductCubit>().addNewProduct(name: 'beats 122', description: 'beats', stock: 96, price: 899);

            // showDialog(context: context, builder: (BuildContext context){
            //   return const AddProductDialogBox();
            //   return BlocProvider(
            //       create: (context)=> getIt<AddNewProductCubit>(),
            //       child: const AddProductDialogBox());
            // });
          },
        ),
      ),
    );
  }
}
