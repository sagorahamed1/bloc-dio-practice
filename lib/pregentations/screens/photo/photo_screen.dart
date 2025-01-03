import 'package:bloc_api_request/bloc/photo/photo_bloc.dart';
import 'package:bloc_api_request/bloc/photo/photo_event.dart';
import 'package:bloc_api_request/bloc/photo/photo_state.dart';
import 'package:bloc_api_request/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PhotoBloc>().add(FetchPhoto());
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PhotoBloc, PhotoState>(builder: (context, state) {
        if(state is PhotoLoadingState){
          return const Center(child: CircularProgressIndicator());
        }else if(state is PhotoLoadedState){
          return GridView.builder(
            itemCount: state.photoData?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
              var photos = state.photoData?[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          context.pushNamed(Routes.photoDetailsScreen, extra: {
                            "photo" : photos.url,
                            "title" : photos.title
                          }
                          );
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green)
                            ),
                            child: Image.network(photos!.url.toString())),
                      ),
                    )
                  ],
                );
              },
          );
        }
        return const SizedBox();
      },),
    );
  }
}
