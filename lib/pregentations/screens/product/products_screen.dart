import 'package:bloc_api_request/bloc/products/products_bloc.dart';
import 'package:bloc_api_request/bloc/products/products_event.dart';
import 'package:bloc_api_request/bloc/products/products_state.dart';
import 'package:bloc_api_request/bloc/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductsBloc>().add(GetProductEvent());

    return Scaffold(
      appBar: AppBar(title: const Text("Products"),),
      body: BlocBuilder<ProductsBloc, ProductState>(
        builder: (context, state) {
          if(state is ProductInitState){
            return const Text("product init state");
          }else if(state is ProductLoadingState){
            return const Center(child: CircularProgressIndicator());
          }else if(state is ProductLoadedState){
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                var product = state.products[index];
                return ListTile(
                  title: Text(product.title.toString()),
                  subtitle: Text(product.userId.toString()),
                );
              },
            );
          }
          return const Text("data");
        },
      ),
    );
  }
}
