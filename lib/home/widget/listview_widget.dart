import 'package:flutter/material.dart';
import 'package:myapp/home/dao/home_dao.dart';
import 'package:myapp/inter/http_interface.dart';
import 'package:myapp/model/home_model.dart';
import 'grid_widget.dart';
import 'swipe_widget.dart';

class ListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewWidgetState();
  }
}

class _ListViewWidgetState extends State<ListViewWidget>
    implements HttpInterface {
  HomeChannelModel _homeModel;

  @override
  void initState() {
    super.initState();
    HomeDao.fetchHomeData(this);
  }

  @override
  void onSuccess(Object model) {
    setState(() {
      _homeModel = model;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _homeModel != null
        ? _getListView(_homeModel)
        : Container(width: 0.0, height: 0.0);
  }

  Widget _getListView(HomeChannelModel homeModel) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
        children: <Widget>[
          _getSearchItem(),
          SwipeWidget(homeModel.channelList[0].channelList[0]),
          GridWidget(),
          _getListViewItem(),
          _getListViewItemNormal(),
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

  _getListViewItem() {
    return Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.2, color: Colors.grey)),
        ),
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '新闻资讯',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            Icon(Icons.add_box)
          ],
        ));
  }

  _getListViewItemNormal() {
    return Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.2, color: Colors.grey)),
        ),
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/ic_item.jpg',
              fit: BoxFit.fitHeight,
              width: 120.0,
              height: 90.0,
            ),
            Expanded(
              child: Container(
                height: 90.0,
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('title',
                        style: TextStyle(color: Colors.black, fontSize: 14.0)),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text('2020/3/29',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
