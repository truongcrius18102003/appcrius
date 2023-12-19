import 'package:flutter/material.dart';
import 'tab_menu.dart';
import 'tab_setting.dart';
import 'tab_search.dart';
import 'user.dart';
import 'post.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('vi'), // Ngôn ngữ mặc định là tiếng Việt
      supportedLocales: [
        Locale('vi'), // Tiếng Việt
        Locale('en'), // Tiếng Anh
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: 'Two TabBars with Menu Icon',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String appBarTitle = 'CRIUS';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Số lượng tab
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuContent()),
                    );
                  },
                ),
                title: Text(appBarTitle),
                floating: true,
                pinned: true,
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchTab()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingContent()),
                      );
                    },
                  ),
                ],
              ),
            ];
          },
          body: TabBarView(
            children: [
              // Nội dung cho Tab 1
              NewsPage(),
              // Nội dung cho Tab 2
              UserProfileTab(),
            ],
          ),
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            onTap: (index) {
              setState(() {
                if (index == 0) {
                  appBarTitle = 'Trang chủ';
                } else {
                  appBarTitle = 'Người dùng';
                }
              });
            },
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
        ),
      ),
    );
  }
}
