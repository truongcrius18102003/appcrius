import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  final List<Map<String, String>> newsArticles = [
    {
      'title': 'Tổng bí thư: Ngoại giao là điểm sáng trong thành tựu đất nước',
      'description':
          'Tổng bí thư Nguyễn Phú Trọng đề cao thành tựu đối ngoại của Việt Nam thời gian qua, khi phát biểu tại Hội nghị Ngoại giao lần thứ 32.',
      'image': 'assets/post1.jpg',
    },
    {
      'title':
          'Ông Nguyễn Minh Triết tái đắc cử Chủ tịch Hội Sinh viên Việt Nam',
      'description':
          'Ban chấp hành Trung ương Hội Sinh viên Việt Nam khóa 11 gồm 103 thành viên, ông Nguyễn Minh Triết, Bí thư Trung ương Đoàn, giữ chức Chủ tịch.',
      'image': 'assets/post2.jpg',
    },
    {
      'title': 'Lắp camera giám sát sau vụ "học sinh ăn mì tôm chan với cơm"',
      'description':
          'LÀO CAI - Sở Giáo dục và Đào tạo đề nghị các trường lắp camera giám sát bữa ăn bán trú, sau vụ học sinh phải ăn mì tôm chan với cơm ở trường Hoàng Thu Phố 1.',
      'image': 'assets/post3.png',
    },
    {
      'title': 'Yamaha PG-1 đội giá 5 triệu đồng',
      'description':
          'TP HCM - Mẫu underbone đa dụng, vừa đi phố vừa đi phượt của Yamaha kênh giá cao nhất 5 triệu, lên mức 36 triệu đồng tại đại lý vì khan hàng.',
      'image': 'assets/post4.jpg',
    },
    {
      'title': 'Loạt ôtô mới sắp ra mắt tại Việt Nam',
      'description':
          'Trước Tết Nguyên đán, những mẫu như Mitsubishi Xforce, Hyundai Venue, Haima 7X, Volkswagen Viloran, Lynk & Co 09 sẽ trình làng khách Việt.',
      'image': 'assets/post5.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: ListView.builder(
        itemCount: newsArticles.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ArticleDetailPage(article: newsArticles[index]),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    newsArticles[index]['image']!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsArticles[index]['title']!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          newsArticles[index]['description']!,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ArticleDetailPage extends StatelessWidget {
  final Map<String, String> article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article['title'] ?? 'Article Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              article['image'] ?? 'assets/default_image.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              article['title'] ?? 'Title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              article['description'] ?? 'Description',
              style: TextStyle(fontSize: 18),
            ),

            // Add more details if needed
          ],
        ),
      ),
    );
  }
}
