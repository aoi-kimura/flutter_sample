import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../model/Item.dart';

class HomeRepository {
  Future<List<Item>> searchResult(String text) async {
    String url =
        "https://qiita.com/api/v2/items?page=1&per_page=20&query=$text";

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Something occurred.');
    }

    List<Item> items = (json.decode(response.body) as List)
        .map((e) => new Item.fromJson(e))
        .toList();

    return items;
  }
}
