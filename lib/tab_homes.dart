import 'package:flutter/material.dart';
import 'package:flutter_news_service/flutter_news_service.dart';
import 'mode1.dart';

class TabHomes extends StatelessWidget {
  late final FlutterNewsService newsService;
  late final List<OptionItem> options;

  TabHomes(BuildContext context) {
    newsService = FlutterNewsService('fd22a9969b744e3e8f0d9e3080bb7c63');
    options = [
      OptionItem(
        title: 'Tin tức',
        imagePath: 'assets/images/anh1.jpg',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                page: Mode1(newsService: newsService),
                heroTag: 'news_hero_tag',
              ),
            ),
          );
        },
        heroTag: 'news_hero_tag', // Thêm heroTag cho từng OptionItem
      ),
      OptionItem(
        title: 'Lựa chọn khác',
        imagePath: 'assets/images/anh2.jpg',
        onPressed: () {},
        heroTag: 'option_2_hero_tag', // Thêm heroTag cho từng OptionItem
      ),
      // Thêm các mục lựa chọn khác tương tự ở đây
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (options[index].onPressed != null) {
                options[index].onPressed!();
              } else {
                // Xử lý khi người dùng chọn Option 2
              }
            },
            child: Hero(
              tag: options[index].heroTag, // Sử dụng Hero widget
              child: ListTile(
                leading: Image.asset(
                  options[index].imagePath,
                  width: 50,
                  height: 50,
                ),
                title: Text(options[index].title),
              ),
            ),
          );
        },
      ),
    );
  }
}

class OptionItem {
  final String title;
  final String imagePath;
  final VoidCallback?
      onPressed; // Thay đổi từ Widget? page thành VoidCallback? onPressed
  final String heroTag;

  OptionItem({
    required this.title,
    required this.imagePath,
    required this.onPressed, // Thay đổi tên thuộc tính và kiểu dữ liệu
    required this.heroTag,
  });
}

class DetailScreen extends StatelessWidget {
  final Widget page;
  final String heroTag;

  DetailScreen({required this.page, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: heroTag, // Sử dụng cùng heroTag để tạo hiệu ứng Hero
          child: page,
        ),
      ),
    );
  }
}
