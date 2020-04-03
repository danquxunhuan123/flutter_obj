import 'package:flutter/material.dart';
import 'package:myapp/home/widget/list_widget.dart';
import 'package:myapp/model/home_model.dart';

import 'grid_widget.dart';
import 'swipe_widget.dart';

class ListViewPage extends StatefulWidget {
  final ChannelList _channelList;

  ListViewPage(this._channelList);

  @override
  State<StatefulWidget> createState() {
    return _ListViewPageState();
  }
}

class _ListViewPageState extends State<ListViewPage> {

  @override
  Widget build(BuildContext context) {
    return widget._channelList != null
        ? _getListView(widget._channelList)
        : Container(width: 0.0, height: 0.0);
  }

  Widget _getListView(ChannelList homeModel) {
    List<ChannelList> channelList = homeModel.channelList;
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
        children: <Widget>[
          _getSearchItem(),
          SwipeWidget(channelList[0]),
          GridWidget(channelList[3]),
          ListWidget(channelList[1]),
          ListWidget(channelList[2]),
        ],
      ),
    );
  }

  _getSearchItem() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.search),
            Text(
              '请输入关键字',
              style: TextStyle(color: Colors.black38, fontSize: 14.0),
            ),
          ],
        ));
  }
}
