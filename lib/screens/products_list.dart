
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

import '../blocs/my_product/my_product_bloc.dart';
import '../widgets/load_widget.dart';

class ProductListScreen extends StatefulWidget {
  static const String route = "/products";

  final String productName;

  const ProductListScreen({super.key, required this.productName});

  @override
  State<ProductListScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<MyProductBloc>().add(GetProduct(OpenFoodFactsLanguage.FRENCH, List.of([widget.productName])));

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List : ${widget.productName}'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: BlocListener<MyProductBloc, MyProductState> (
          listener: (context, state) {
            if (state is MyProductError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: BlocBuilder<MyProductBloc, MyProductState> (
            builder: (context, state) {
              if (state is MyProductLoading) {
                return LoadWidget();
              } else if (state is MyProductLoaded) {
                return ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      ImageProvider? provider;
                      debugPrint(state.products[index].imageFrontUrl);
                      if (state.products[index].imageFrontUrl != null){
                        provider = Image.network(state.products[index].imageFrontUrl!, width: 100, height: 100).image;
                      } else {
                        provider = Image.asset("assets/images/question_mark.png", width: 100, height: 100).image;
                      }
                      return ListTile(
                        title: Text(state.products[index].productName ?? '${widget.productName} item $index'),
                        leading: CircleAvatar(
                          backgroundImage: provider,
                          backgroundColor: Colors.grey,
                        ),
                        onTap: () => { Navigator.pushNamed(context, '/products/product_detail', arguments: state.products[index])}
                      );
                    }
                );
              } else {
                return Container();
              }
            }
          )
        )
      )
    );
  }
}