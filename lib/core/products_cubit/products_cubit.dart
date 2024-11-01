import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/entites/products_entity.dart';
import 'package:tmart_expiry_date/core/repo/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  getProducts() async {
    emit(ProductsLoading());
    var result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(message: failure.messages)),
      (products) {
        if (products.isNotEmpty) {
          emit(ProductsSuccses(products: products));
        } else {
          emit(NoFoundProductsState());
        }
      },
    );
  }

  getProductsByFilter({required String filter}) async {
    emit(ProductsLoading());
    var result = await productsRepo.getProductsByFilter(filter: filter);
    result.fold(
      (failure) => emit(ProductsFailure(message: failure.messages)),
      (products) {
        if (products.isNotEmpty) {
          emit(ProductsSuccses(products: products));
        } else {
          emit(NoFoundProductsState());
        }
      },
    );
  }
}
