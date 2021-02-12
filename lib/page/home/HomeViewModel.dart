import 'package:flutter/material.dart';
import 'package:flutter_sample/model/Item.dart';
import 'package:flutter_sample/page/home/HomeRepository.dart';

class HomeViewModel extends ChangeNotifier {
  List<Item> _items = [];
  List<Item> get items => _items;

  final HomeRepository repo;

  HomeViewModel({@required this.repo});

  void onChanged(String text) async {
    _items = await repo.searchResult(text);
    notifyListeners();
  }
}
