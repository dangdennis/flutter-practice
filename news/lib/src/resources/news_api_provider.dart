import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';
import './repository.dart';

final _hackerNewsUrl = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final response = await client.get('$_hackerNewsUrl/topstories.json');
    final ids = json.decode(response.body);
    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get('$_hackerNewsUrl/item/$id.json?');
    final parsedJson = json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}
