import '../../models/product_model.dart';

abstract class BaseProductRepo {
  Stream<List<Product>> getAllProducts();
}
