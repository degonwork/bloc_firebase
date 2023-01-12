import '../../models/category_model.dart';

abstract class BaseCategoryRepo {
  Stream<List<Category>> getAllCategories();
}
