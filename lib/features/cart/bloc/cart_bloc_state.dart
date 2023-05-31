part of 'cart_bloc_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartBlocInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;
  CartSuccessState({
    required this.cartItems,
  });


}
