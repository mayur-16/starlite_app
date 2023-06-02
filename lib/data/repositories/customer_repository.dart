

import 'package:dartz/dartz.dart';
import 'package:starlite_app/core/local_db_client.dart';
import 'package:starlite_app/domain/entities/app_error.dart';

import '../models/customer_model.dart';

class CustomerRepository{
CustomerRepository._();

static addNewCustomer({required String name , String? location}) async{
  bool response=await LocalDataBaseClient
      .postQuery(query: 'INSERT INTO Customer(name, location) VALUES("$name", "$location")');
  return response;
}

static getAllCustomers() async{
   List<Map> response = await LocalDataBaseClient
       .getQuery(query: 'SELECT * FROM Customer');

   List<CustomerModel> responsemodel= response.map((e) => CustomerModel(id: e['id'],
       name: e['name'],
       location: e['location'])).toList();

   return responsemodel;
}

}