import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/dao/home_dao.dart';
import 'package:myapp/inter/http_interface.dart';
import 'package:myapp/model/home_model.dart';
import 'package:myapp/pages/user/setting_user.dart';
import 'package:myapp/pages/user/user_page.dart';
import 'package:myapp/pages/widget/listview_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: '/',
//      home: MyStatefulWidget(),
      routes: {
        '/': (content) => MyStatefulWidget(),
        SettingUser.routeName: (content) => SettingUser(),
      },
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  var pages = List<Widget>();

  @override
  void initState() {
    super.initState();

    pages
      ..add(ListViewPage())
      ..add(Text('Index 1: Business',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))
      ..add(UserPageWidget());

    HomeDao.fetchHomeData(HttpInterface(onSuccess: onHomeDataSuccess));
  }

  onHomeDataSuccess(Object model) {
    HomeChannelModel _homeModel = model;
    pages.removeAt(0);
    pages.insert(0, ListViewPage(channelList: _homeModel.channelList[0]));
    setState(() {});
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30.0),
        child: IndexedStack(
          index: _selectedIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('user'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  var _widgetOptions = Map();

//  _navigationItem(index) {
//    switch (index) {
//      case 0:
//        if (_homeModel == null) return ListViewPage();
//
//        if (_widgetOptions[index] != null) return _widgetOptions[index];
//
//        _widgetOptions[index] =
//            ListViewPage(channelList: _homeModel.channelList[0]);
//
//        return _widgetOptions[index];
//      case 1:
//        if (_widgetOptions[index] != null) return _widgetOptions[index];
//
//        _widgetOptions[index] = Text('Index 1: Business',
//            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
//        return _widgetOptions[index];
//      case 2:
//        if (_widgetOptions[index] != null) return _widgetOptions[index];
//
//        _widgetOptions[index] = UserPageWidget();
//        return _widgetOptions[index];
//    }
//  }
}
