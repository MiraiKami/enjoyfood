part of 'my_product_bloc.dart';

abstract class MyProductState extends Equatable {

  @override
  List<Object> get props => [];
}

class MyProductInitial extends MyProductState {}

class MyProductLoading extends MyProductState {}

class MyProductLoaded extends MyProductState {
  final List<Product> products;

  MyProductLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class MyProductError extends MyProductState {
  final String message;

  MyProductError(this.message);
  @override
  List<Object> get props => [message];
}