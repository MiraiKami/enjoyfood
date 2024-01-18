import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

import '../../services/openfood_service.dart';

part 'my_product_event.dart';
part 'my_product_state.dart';

class MyProductBloc extends Bloc<MyProductEvent, MyProductState> {

  MyProductBloc() :
        super(MyProductInitial())
  {
    on<GetProduct>((event, emit) async {
      try {
        emit(MyProductLoading());
        final result = await OpenFoodService.searchProductByName(event.language, event.terms);

        final List<Product> products = result.products ?? List.empty();

        emit(MyProductLoaded(products : products));
      } catch (e) {
        emit(MyProductError("An error occured while loading position $e"));
      }
    });
  }
}