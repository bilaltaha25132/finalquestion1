import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/firebase_service.dart';
import '../models/product.dart';
import 'category_provider.dart';

final firebaseServiceProvider = Provider((ref) => FirebaseService());

final productProvider =
    StreamProvider.family<List<Product>, String>((ref, categoryId) {
  return ref.watch(firebaseServiceProvider).getProducts(categoryId);
});
