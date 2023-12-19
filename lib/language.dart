import 'package:flutter/material.dart';
import 'main.dart';

class SettingLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Tiếng Việt'),
            onTap: () {
              switchLanguage(Locale('vi'));
              Navigator.pop(context); // Đóng SettingsPage sau khi chọn ngôn ngữ
            },
          ),
          ListTile(
            title: Text('English'),
            onTap: () {
              switchLanguage(Locale('en'));
              Navigator.pop(context); // Đóng SettingsPage sau khi chọn ngôn ngữ
            },
          ),
        ],
      ),
    );
  }
}

void switchLanguage(Locale newLocale) {
  runApp(MyApp());
}
