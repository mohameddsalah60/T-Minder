import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/features/my_products/domin/repos/my_product_repo.dart';

part 'my_products_state.dart';

class MyProductsCubit extends Cubit<MyProductsState> {
  MyProductsCubit(this.myProductRepo) : super(MyProductsInitial());
  final MyProductRepo myProductRepo;
  Future<void> getBarcode() async {
    var barcodeResult = await myProductRepo.getBarcode();
    barcodeResult.fold(
      (failure) => emit(MyProductsGetBarcodeFailure(message: failure.messages)),
      (barcode) => emit(MyProductsGetBarcodeSuccsess(barcode: barcode)),
    );
  }
}
