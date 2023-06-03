import 'package:flutter/material.dart';
import 'package:house_tech/web/models/product.dart';

class LikeProvider with ChangeNotifier {
  List<Product> _likeItems = [];
  List<Product> get likeItems => _likeItems;

  Future<String> addLikeItem(Product likeItem) async {
    _likeItems.add(likeItem);
    notifyListeners();
    return 'success';
  }

  void removeLikeItem(Product likeItem) {
    _likeItems.remove(likeItem);
    notifyListeners();
  }

  void clearLike() {
    _likeItems.clear();
    notifyListeners();
  }
}
