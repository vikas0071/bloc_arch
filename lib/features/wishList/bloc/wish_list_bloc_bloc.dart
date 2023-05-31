import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wish_list_bloc_event.dart';
part 'wish_list_bloc_state.dart';

class WishListBlocBloc extends Bloc<WishListBlocEvent, WishListBlocState> {
  WishListBlocBloc() : super(WishListBlocInitial()) {
    on<WishListBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
