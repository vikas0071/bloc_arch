// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_arch/data/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:bloc_arch/features/home/models/home_products_data_models.dart';

import '../bloc/cart_bloc_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;

  const CartTileWidget({
    Key? key,
    required this.productDataModel,
    required this.cartBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            productDataModel.imageUrl,
          ),
          Text(
            productDataModel.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            productDataModel.description,
            style: TextStyle(fontSize: 15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ " + productDataModel.price.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(children: [
                IconButton(
                  onPressed: () {
                    // homebloc.add(HomeProductWishListButtonClickedEevent(
                    //     clickedProduct: productDataModel));
                  },
                  icon: Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {
                   
                    // homebloc.add(HomeProductCartButtonClickedEevent(
                    //     clickedProduct: productDataModel));
                  },
                  icon: Icon(Icons.delete),
                )
              ])
            ],
          ),
        ],
      ),
    );
  }
}
