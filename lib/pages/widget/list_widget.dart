import 'package:flutter/material.dart';
import 'package:myapp/pages/dao/home_dao.dart';
import 'package:myapp/inter/http_interface.dart';
import 'package:myapp/model/home_model.dart';
import 'package:myapp/model/list_item_model.dart';
import 'package:myapp/pages/detail_page.dart';
import 'package:myapp/pages/webview_demo.dart';

class ListWidget extends StatefulWidget {
  final ChannelList _channelList;

  const ListWidget(this._channelList);

  @override
  State<StatefulWidget> createState() {
    return _ListWidgetState();
  }
}

class _ListWidgetState extends State<ListWidget> {
  ListItemModel _listItemModel;

  @override
  void initState() {
    super.initState();

    HomeDao.fetchListData(
        widget._channelList.url, HttpInterface(onSuccess: onListDataSuccess));
  }

  onListDataSuccess(Object model) {
//    Future.delayed(Duration(seconds: 1)).then((e){
//      setState(() {
//        _listItemModel = model;
//      });
//    });
    setState(() {
      _listItemModel = model;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _listItemModel != null
        ? _getListViewItem(
            widget._channelList.cname, _listItemModel.listDatas.sublist(0, 3))
        : Container(width: 0.0, height: 0.0);
  }

  _getListViewItem(String cname, List<ListDatas> listDatas) {
    List<Widget> widgets = _getListViewItemNormal(listDatas);
    return Center(
      child: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 0.2, color: Colors.grey)),
              ),
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    cname,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  RaisedButton(
//                    onPressed: () {
//                      Navigator.pushNamed(context, DetailPage.routeName,
//                          arguments: cname);
//                    },
                    child: Icon(Icons.add_box),
                  )
                ],
              )),
          Column(
            children: widgets,
          ),
        ],
      ),
    );
  }

  _getListViewItemNormal(List<ListDatas> list) {
    return list.map((item) {
      return RaisedButton(
        color: Colors.white,
        shape: Border.all(style: BorderStyle.none),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (content) => WebViewExample()));
//          Navigator.pushNamed(context, DetailPage.routeName,
//              arguments: item);
        },
        child: Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.2, color: Colors.grey)),
            ),
            child: Row(
              children: <Widget>[
                item.images != null && item.images.length > 0
                    ? Image.network(
                        item.images[0].src,
                        fit: BoxFit.fitHeight,
                        width: 120.0,
                        height: 90.0,
                      )
                    : Container(width: 0.0, height: 0.0),
                Expanded(
                  child: Container(
                    height: 90.0,
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(item.title,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0)),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(item.time,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.0)),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      );
    }).toList();
  }
}
