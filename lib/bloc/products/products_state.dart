import 'package:bloc_api_request/models/product_model.dart';

abstract class ProductState {}

class ProductInitState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<ProductModel>  products;

  ProductLoadedState(this.products);
}

class ProductErrorState extends ProductState {
  final String errorMessage;

  ProductErrorState(this.errorMessage);
}
