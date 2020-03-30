import 'package:flutter/material.dart';
import 'swipe_widget.dart';
import 'grid_widget.dart';

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _getListView();
  }

  Widget _getListView() {
    return Container(
      color: Colors.white,
      child: ListView(
        padding:
            const EdgeInsetsDirectional.only(start: 10.0, top: 10.0, end: 10.0),
        children: <Widget>[
          _getSearchItem(),
          SwipeWidget(),
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
