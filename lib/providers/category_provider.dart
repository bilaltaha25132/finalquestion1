import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/firebase_service.dart';
import '../models/category.dart';

final firebaseServiceProvider = Provider((ref) => FirebaseService());

final categoryProvider = StreamProvider<List<Category>>((ref) {
  final firebaseService = ref.watch(firebaseServiceProvider);
  return firebaseService.getCategories();
});
