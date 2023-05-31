import 'package:bloc_arch/features/home/ui/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/ui/cartScreen.dart';
import '../../wishList/ui/wishList.dart';
import '../bloc/home_bloc_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const WishListScreen();
          }));
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CartScreen();
          }));
        } else if (state is HomeProductItemWishListedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Item is Added to WishList..."),
            ),
          );
        } else if (state is HomeProductItemCartListedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Item is Added to Cart..."),
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccessState:
            final successstate = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.redAccent,
                title: Text('Home Screen'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishListButtonNavigatedEevent());
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigatedEevent());
                      },
                      icon: Icon(Icons.shopping_cart_outlined)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successstate.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                        homebloc: homeBloc,
                        productDataModel: successstate.products[index]);
                  }),
            );

          case HomeErrorState:
            return Scaffold(
                body: Center(
                    child: Text(
              'Something went wrong',
            )));

          default:
            return Container();
        }
      },
    );
  }
}
