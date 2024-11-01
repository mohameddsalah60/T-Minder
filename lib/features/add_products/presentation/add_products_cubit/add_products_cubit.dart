import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/entites/products_entity.dart';
import 'package:tmart_expiry_date/features/add_products/domin/repos/add_products_repo.dart';

part 'add_products_state.dart';

class AddProductsCubit extends Cubit<AddProductsState> {
  AddProductsCubit(this.addProductsRepo) : super(AddProductsInitial());
  final AddProductsRepo addProductsRepo;
  addProductInput({required ProductsEntity addProductInputEntity}) async {
    emit(AddProductsLoading());
    var result = await addProductsRepo.addProductInput(
        productEntity: addProductInputEntity);
    result.fold(
      (failure) {
        emit(AddProductsFailure(message: failure.messages));
      },
      (product) {
        emit(AddProductsSuccses());
      },
    );
  }

  Future<void> getBarcode() async {
    var barcodeResult = await addProductsRepo.getBarcode();
    barcodeResult.fold(
      (failure) => emit(GetBarcodeFailure(message: failure.messages)),
      (barcode) => emit(GetBarcodeSuccsess(barcode: barcode)),
    );
  }
}
