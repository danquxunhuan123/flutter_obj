import 'package:flutter/material.dart';
import 'package:myapp/pages/user/setting_user.dart';

class UserPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserPageWidgetState();
  }
}

class UserPageWidgetState extends State<UserPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _userTop(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[Text('我的预约'), Text('代办事项')],
        ),
        Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('我的检测包'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('我的检测包'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('我的检测包'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('我的检测包'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('我的检测包'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        )
      ],
    );
  }

  _userTop() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.asset(
          'assets/bg_user.png',
          fit: BoxFit.fitWidth,
        ),
        Column(
          children: <Widget>[
            Image.asset(
              'assets/icon_user_head.png',
              width: 50.0,
              height: 50.0,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('username'),
            )
          ],
        ),
        Positioned(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context,SettingUser.routeName);
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (content) => SettingUser()));
            },
            child: Icon(Icons.settings),
          ),
          right: 5.0,
          top: 5.0,
        )
      ],
    );
  }
}
