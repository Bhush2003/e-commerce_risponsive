import 'package:e_commerce_responsive/framework/repository/product/model/product_detail_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = Provider<List<ProductDetailModel>>((ref) {
  return [];
});
