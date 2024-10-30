import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/features/my_products/domin/entites/add_product_input_entity.dart';
import 'package:tmart_expiry_date/features/my_products/domin/repos/my_product_repo.dart';

part 'add_products_state.dart';

class AddProductsCubit extends Cubit<AddProductsState> {
  AddProductsCubit(this.myProductRepo) : super(AddProductsInitial());
  final MyProductRepo myProductRepo;
  addProductInput(
      {required AddProductInputEntity addProductInputEntity}) async {
    emit(AddProductsLoading());
    var result = await myProductRepo.addProductInput(
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
    var barcodeResult = await myProductRepo.getBarcode();
    barcodeResult.fold(
      (failure) => emit(GetBarcodeFailure(message: failure.messages)),
      (barcode) => emit(GetBarcodeSuccsess(barcode: barcode)),
    );
  }
}
