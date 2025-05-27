import 'package:bloc_api_6_7/screens/details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';

class HomeSceen extends StatelessWidget {
  const HomeSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(productId: product.id),
                      ),
                    );
                  },
                  leading: CachedNetworkImage(
                    imageUrl: product.image,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  title: Text(product.title),
                  subtitle: Text("\$${product.price}"),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text("Error: ${state.message}"));
          } else {
            return const Center(child: Text("No data"));
          }
        },
      ),
    );
  }
}
