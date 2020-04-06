import 'package:flutter/material.dart';
import 'package:myapp/model/home_model.dart';

class GridWidget extends StatelessWidget {
  List<ChannelList> _channelList = List();
  var pics = [
    'assets/icon_zixun.png',
    'assets/icon_jiance.png',
    'assets/icon_zhishi.png',
    'assets/icon_zx.png',
    'assets/icon_yiyao.png',
    'assets/icon_school.png',
  ];

  GridWidget(ChannelList channelList) {
    _channelList.add(ChannelList(cname: '咨询', url: ''));
    _channelList.add(ChannelList(cname: '检测', url: ''));
    _channelList.addAll(channelList.channelList);
  }

  @override
  Widget build(BuildContext context) {
    return _getGridView();
  }

  _getGridView() {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: Column(
        children: <Widget>[
          _getRow(_channelList.sublist(0, 3), pics.sublist(0, 3)),
          _getRow(_channelList.sublist(3, 6), pics.sublist(3, 6)),
        ],
      ),
    );
  }

  _getRow(List<ChannelList> sublist, List<String> pics) {
    return Row(
      children: <Widget>[
        _getRowItem(sublist[0], pics[0]),
        _getRowItem(sublist[1], pics[1]),
        _getRowItem(sublist[2], pics[2])
      ],
    );
  }

  _getRowItem(ChannelList sublist, String pic) {
    return Expanded(
      child: Container(
        decoration: ShapeDecoration(
          shape: Border(
              top: BorderSide(width: 0.2, color: Colors.grey),
              right: BorderSide(width: 0.2, color: Colors.grey)),
        ),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 40.0,
              height: 20.0,
              child: Image.asset(pic,fit: BoxFit.contain,),
            ),
            Container(
              child: Text(sublist.cname),
            )
          ],
        ),
      ),
    );
  }
}
