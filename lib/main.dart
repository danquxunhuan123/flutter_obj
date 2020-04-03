import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myapp/home/dao/home_dao.dart';
import 'package:myapp/home/widget/listview_page.dart';
import 'package:myapp/inter/http_interface.dart';
import 'package:myapp/model/home_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  HomeChannelModel _homeModel;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    HomeDao.fetchHomeData(HttpInterface(onSuccess: onHomeDataSuccess));
  }

  onHomeDataSuccess(Object model) {
    setState(() {
      _homeModel = model;
    });
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _homeModel != null
        ? Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: _navigationItem(_selectedIndex),
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
                  title: Text('School'),
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),
          )
        : Container(width: 0.0, height: 0.0);
  }


//  var navigatorViews = Map();
  _navigationItem(index) {
    switch (index) {
      case 0:
        return _homeModel != null
            ? ListViewPage(_homeModel.channelList[0])
            : Container(width: 0.0, height: 0.0);
      case 1:
        return Text(
          'Index 1: Business',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        );
      case 2:
        return Text(
          'Index 2: School',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        );
    }
  }
}
