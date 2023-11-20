import 'package:bnb_with_bloc/models/Api.dart';
import 'package:bnb_with_bloc/models/News.dart';
import 'package:flutter/material.dart';

class NewsProvider with ChangeNotifier {
  bool isLoading = true;
  List<News> news = [];
  //
  NewsProvider() {
    fetchData();
  }
  Future<void> fetchData() async {
    List<dynamic> _news = await API.getMarkets();
    List<News> temp = [];
    for (var news in _news) {
      News newNews = News.fromJSON(news);
      temp.add(newNews);
    }
    news = temp;
    isLoading = false;
    notifyListeners();
  }
}
