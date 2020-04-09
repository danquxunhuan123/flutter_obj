import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:myapp/dao/home_dao.dart';
import 'package:myapp/inter/http_interface.dart';
import 'package:myapp/model/banner_model.dart';
import 'package:myapp/model/home_model.dart';

class SwipeWidget extends StatefulWidget {
  final ChannelList channelList;

  SwipeWidget(this.channelList);

  @override
  State<StatefulWidget> createState() {
    return _SwipeWidgetState(channelList.url);
  }
}

class _SwipeWidgetState extends State<SwipeWidget>{
  List<ListDatas> _bannerData;
  String _url;

  _SwipeWidgetState(this._url);

  @override
  void initState() {
    super.initState();
    HomeDao.fetchBannerData(_url, HttpInterface(onSuccess: onBannerDataSuccess));
  }

  onBannerDataSuccess(Object model){
    BannerModel banner = model;
    setState(() {
      _bannerData = banner.listDatas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _bannerData != null && _bannerData.length > 0
        ? _swiper(_bannerData)
        : Container(width: 0.0, height: 0.0);
  }

  _swiper(List<ListDatas> bannerData) {
    var lines = _indicators(bannerData);
    return Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return _item(index, context, bannerData);
              },
              itemCount: bannerData.length,
              autoplay: true),
        ),
        lines
      ],
    );
  }

  _item(int index, BuildContext context, List<ListDatas> bannerData) {
    ListDatas data = bannerData[index];
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(data.images[0].src, fit: BoxFit.fitWidth),
        ),
        Container(
          constraints: BoxConstraints.expand(
              height: Theme.of(context).textTheme.display1.fontSize),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.none),
            color: Colors.black45,
          ),
          child: Text(
            data.title,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ],
      alignment: Alignment.bottomLeft,
    );
  }

  _indicators(List<ListDatas> bannerData) {
    var bannerWidgets = bannerData.map((value) {
      return Container(
        margin: EdgeInsets.all(10.0),
        width: 21.0,
        height: 3.0,
        decoration: BoxDecoration(
          border: Border.all(style: BorderStyle.none),
          color: Colors.grey,
          borderRadius: BorderRadius.circular(3.0),
        ),
      );
    });
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: bannerWidgets.toList(),
      ),
    );
  }
}
