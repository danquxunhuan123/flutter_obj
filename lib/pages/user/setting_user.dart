import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingUserState();
  }
}

class _SettingUserState extends State<SettingUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('个人资料'), centerTitle: true),
      body: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('头像'),
            trailing: GestureDetector(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=541903594,1559354849&fm=26&gp=0.jpg'),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (content) => AlertDialog(
                          title: Text('修改昵称'),
                          content: TextField(
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '输入昵称',
                            ),
                          ),
                          actions: <Widget>[
                            RaisedButton(
                              child: Text('ok'),
                              onPressed: (){
                              },
                            ),
                            RaisedButton(
                              child: Text('cancle'),
                              onPressed: ()=> Navigator.of(context).pop(),
                            ),
                          ],
                        ));
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('昵称'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('lowbitter'),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
