import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/user/photo_page.dart';
import 'package:myapp/pages/user/photo_page_copy.dart';

class SettingUser extends StatefulWidget {
  static const routeName = '/setting_user';

  @override
  State<StatefulWidget> createState() {
    return _SettingUserState();
  }
}

class _SettingUserState extends State<SettingUser> {
  TextEditingController myController;
  String nickName = '';

  @override
  void initState() {
    super.initState();
    myController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
  }

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
            ),
            onTap: () => bottomShow(),
          ),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('昵称'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[Text(nickName), Icon(Icons.arrow_forward_ios)],
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (content) => AlertDialog(
                        title: Text('修改昵称'),
                        content: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '输入昵称',
                          ),
                          controller: myController,
                        ),
                        actions: <Widget>[
                          RaisedButton(
                            child: Text('ok'),
                            onPressed: () {
                              setState(() {
                                nickName = myController.text;
                              });

                              Navigator.of(context).pop();
                            },
                          ),
                          RaisedButton(
                            child: Text('cancle'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ));
            },
          ),
        ],
      ),
    );
  }

  bottomShow() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              actions: <Widget>[
                CupertinoActionSheetAction(
                    child: Text('拍照'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (content) => PhotoPage()));
                    }),
                CupertinoActionSheetAction(
                  child: Text('相册'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (content) => PhotoPageCopy()));
                  },
                ),
              ],
            ));
  }
}
