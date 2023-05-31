import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_arch/data/grocery_data.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_items.dart';
import '../../../data/wish_List_items.dart';
import '../models/home_products_data_models.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeState> {
  HomeBloc() : super(HomeBlocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishListButtonNavigatedEevent>(homeWishListButtonNavigatedEevent);
    on<HomeCartButtonNavigatedEevent>(homeCartButtonNavigatedEevent);
    on<HomeProductWishListButtonClickedEevent>(
        homeProductWishListButtonClickedEevent);
    on<HomeProductCartButtonClickedEevent>(homeProductCartButtonClickedEevent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    print('Home Initial');
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeWishListButtonNavigatedEevent(
      HomeWishListButtonNavigatedEevent event, Emitter<HomeState> emit) {
    print('WishList Clicked');
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeCartButtonNavigatedEevent(
      HomeCartButtonNavigatedEevent event, Emitter<HomeState> emit) {
    print('Cart Clicked');
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductWishListButtonClickedEevent(
      HomeProductWishListButtonClickedEevent event, Emitter<HomeState> emit) {
    print('WishList Clicked');
    wishListItems.add(event.clickedProduct);
    emit(HomeProductItemWishListedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEevent(
      HomeProductCartButtonClickedEevent event, Emitter<HomeState> emit) {
    print('Cart Clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartListedActionState());
  }
}
