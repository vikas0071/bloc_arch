// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeBlocInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products,
  });
}


class HomeErrorState extends HomeState {}


class HomeNavigateToWishListPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}


class HomeProductItemWishListedActionState extends HomeActionState {}

class HomeProductItemCartListedActionState extends HomeActionState {}

