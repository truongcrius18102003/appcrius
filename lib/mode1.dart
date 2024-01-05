import 'package:flutter/material.dart';
import 'package:flutter_news_service/flutter_news_service.dart';

void main() {
  FlutterNewsService newsService =
      FlutterNewsService('fd22a9969b744e3e8f0d9e3080bb7c63');
  runApp(Mode1(newsService: newsService));
}

class Mode1 extends StatefulWidget {
  final FlutterNewsService newsService;

  Mode1({required this.newsService});

  @override
  _Mode1State createState() => _Mode1State();
}

class _Mode1State extends State<Mode1> {
  @override
  void initState() {
    super.initState();
    fetchAndDisplayTopHeadlines();
  }

  Future<void> fetchAndDisplayTopHeadlines() async {
    var topHeadlines =
        await widget.newsService.fetchTopHeadlines(country: 'vn');
    if (topHeadlines != null) {
      // Hiển thị danh sách tiêu đề tin tức trong một SnackBar hoặc một widget khác
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Top Headlines - Vietnam: ${topHeadlines.articles.map((a) => a.title).toList()}',
          ),
        ),
      );
    } else {
      // Xử lý khi không có dữ liệu
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Could not fetch headlines for Vietnam!',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top Headlines - Vietnam'),
        ),
        body: Center(
          child: Text('Fetching top headlines...'),
        ),
      ),
    );
  }
}
