import 'package:bloc_api_request/bloc/products/products_event.dart';
import 'package:bloc_api_request/bloc/products/products_state.dart';
import 'package:bloc_api_request/models/product_model.dart';
import 'package:bloc_api_request/providers/user_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBloc extends Bloc<ProductEvent, ProductState>{
  final GetProvider getProvider;

  ProductsBloc({required this.getProvider}) : super(ProductInitState()){
    on<ProductEvent>(fetchProduct);
  }

  Future <void> fetchProduct(ProductEvent event, Emitter<ProductState> emit)async{

     emit(ProductLoadingState());

    var response = await getProvider.getUser("/todos");

    if(response.statusCode == 200){
      var data = List<ProductModel>.from(response.data.map((x)=> ProductModel.fromJson(x)));

      emit(ProductLoadedState(data));
    }else{
      emit(ProductErrorState(response.data.toString()));
    }


  }

}