import 'package:flutter_bloc/flutter_bloc.dart';

import '../repos/products_repo.dart';

part 'delete_products_state.dart';

class DeleteProductsCubit extends Cubit<DeleteProductsState> {
  DeleteProductsCubit(this.productsRepo) : super(DeleteProductsInitial());
  final ProductsRepo productsRepo;

  deleteProducts({required String barcode}) async {
    var result = await productsRepo.deleteProduct(barcode: barcode);
    result.fold(
      (failure) => emit(DeleteProductFailure(message: failure.messages)),
      (succses) {
        emit(DeleteProductSuccses());
      },
    );
  }
}
