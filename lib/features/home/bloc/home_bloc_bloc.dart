import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeState> {
  HomeBloc() : super(HomeBlocInitial()) {
    on<HomeWishListButtonNavigatedEevent>(homeWishListButtonNavigatedEevent);
    on<HomeCartButtonNavigatedEevent>(homeCartButtonNavigatedEevent);
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
}
