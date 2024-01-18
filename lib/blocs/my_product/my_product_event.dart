part of 'my_product_bloc.dart';

abstract class MyProductEvent extends Equatable {
  const MyProductEvent();

  @override
  List<Object> get props => [];
}

class GetProduct extends MyProductEvent {
  final List<String> terms;
  final OpenFoodFactsLanguage language;

  const GetProduct(this.language, this.terms);
}