// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class HomeProductWishListButtonClickedEevent extends HomeBlocEvent {
  final ProductDataModel clickedProduct;
  HomeProductWishListButtonClickedEevent({
    required this.clickedProduct,
  });

  

}

class HomeProductCartButtonClickedEevent extends HomeBlocEvent {
    final ProductDataModel clickedProduct;
    HomeProductCartButtonClickedEevent({
      required this.clickedProduct,
    });
  
}

class HomeWishListButtonNavigatedEevent extends HomeBlocEvent {
  
  
}

class HomeCartButtonNavigatedEevent extends HomeBlocEvent {
  
}
