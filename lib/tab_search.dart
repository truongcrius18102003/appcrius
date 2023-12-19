import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Enter your search query',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                  // Xử lý tìm kiếm ở đây dựa trên giá trị `_searchText`
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Search Result: $_searchText',
              style: TextStyle(fontSize: 18),
            ),
            // Hiển thị kết quả tìm kiếm ở đây dựa trên giá trị `_searchText`
          ],
        ),
      ),
    );
  }
}
