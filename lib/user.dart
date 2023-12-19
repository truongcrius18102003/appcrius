import 'package:flutter/material.dart';

class UserProfileTab extends StatefulWidget {
  @override
  _UserProfileTabState createState() => _UserProfileTabState();
}

class _UserProfileTabState extends State<UserProfileTab> {
  String userName = 'Lê Quyết Trường';
  String userEmail = 'lequyettruong.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height:
                        140), // Khoảng cách từ top của ảnh nền đến top của thông tin người dùng
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                ),
                SizedBox(height: 20),
                Text(
                  'Name: $userName',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Email: $userEmail',
                  style: TextStyle(fontSize: 18),
                ),
                // Các thông tin khác của người dùng
              ],
            ),
          ),
        ],
      ),
    );
  }
}
