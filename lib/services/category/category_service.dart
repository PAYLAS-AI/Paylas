
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paylas/models/category/category.dart';

class CategoryService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;


  Future<List<Category>> getAllCategories() async {
    final snapshot = await _db.collection('categories').get();
    return snapshot.docs
        .map((doc) => Category.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> addNewCategory(Category category) async {
    await _db.collection('categories').add(category.toMap());
  }

  Future<void> updateCategory(Category category) async {
    await _db.collection('categories').doc(category.id).update(category.toMap());
  }

  Future<void> deleteCategory(String categoryId) async {
    await _db.collection('categories').doc(categoryId).delete();
  }

}
