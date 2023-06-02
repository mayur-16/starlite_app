import 'package:dartz/dartz.dart';
import 'package:starlite_app/core/local_db_client.dart';
import 'package:starlite_app/logger.dart';

import '../../domain/entities/app_error.dart';
import '../models/product_model.dart';

class ProductRepository{
  ProductRepository._();

  static addNewProduct({required String name,String? description,required int stock,required int price}) async{
    bool response=await LocalDataBaseClient
        .postQuery(query: 'INSERT INTO Product(name,description,stock,price) VALUES("$name","${description??''}","$stock","$price")');
    return response;
  }

  static  getAllProducts() async{
    List<Map> response = await LocalDataBaseClient.getQuery(query: 'SELECT * FROM Product');
   List<ProductModel> responsemodel= response.map((e) => ProductModel(id: e['id'],
       name: e['name'],
   price: e['price'])).toList();
   // logInfo('test', 'modeledresponse ${listofProducts[3].id}--'
   //     '${listofProducts[3].name}--${listofProducts[3].price}-');
    return responsemodel;
  }

}