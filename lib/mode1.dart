import 'package:flutter/material.dart';
import 'package:flutter_news_service/flutter_news_service.dart';

void main() {
  FlutterNewsService newsService =
      FlutterNewsService('fd22a9969b744e3e8f0d9e3080bb7c63');
  runApp(Mode1(newsService: newsService));
}

class Mode1 extends StatelessWidget {
  final FlutterNewsService newsService;

  Mode1({required this.newsService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  fetchAndDisplayTopHeadlines(context);
                },
                child: Text('Get Top Headlines'),
              ),
              ElevatedButton(
                onPressed: () {
                  searchAndDisplayNews(context);
                },
                child: Text('Search News'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchAndDisplayTopHeadlines(BuildContext context) async {
    var topHeadlines = await newsService.fetchTopHeadlines(country: 'us');
    // ignore: unnecessary_null_comparison
    if (topHeadlines != null) {
      // Hiển thị thông tin tin tức hoặc xử lý dữ liệu ở đây (ví dụ: hiển thị trên giao diện người dùng)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Top Headlines: ${topHeadlines.articles.map((a) => a.title).toList()}',
          ),
        ),
      );
    } else {
      // Xử lý khi không có dữ liệu
    }
  }

  Future<void> searchAndDisplayNews(BuildContext context) async {
    var searchResult = await newsService.fetchEverything(
      q: 'bitcoin',
      from: '2023-05-15',
      sortBy: 'publishedAt',
    );
    // ignore: unnecessary_null_comparison
    if (searchResult != null) {
      // Hiển thị thông tin tin tức hoặc xử lý dữ liệu ở đây (ví dụ: hiển thị trên giao diện người dùng)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Search Result: ${searchResult.articles.map((a) => a.title).toList()}',
          ),
        ),
      );
    } else {
      // Xử lý khi không có dữ liệu
    }
  }
}
