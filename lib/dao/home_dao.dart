import 'package:myapp/http/http_util.dart';
import 'package:myapp/inter/http_interface.dart';
import 'package:myapp/model/banner_model.dart';
import 'package:myapp/model/home_model.dart';
import 'package:myapp/model/list_item_model.dart' as prefix;

class HomeDao{
  static fetchHomeData(HttpInterface interface){
    HttpUtils.fetchData('http://139.199.128.170:8080/pub/aws/channels.json')
        .then((Map<String, dynamic> map){
      interface.onSuccess(HomeChannelModel.fromJson(map));
    });
  }

  static fetchBannerData(String url,HttpInterface interface){
    HttpUtils.fetchData(url)
        .then((Map<String, dynamic> map){
      interface.onSuccess(BannerModel.fromJson(map));
    });
  }

  static fetchListData(String url,HttpInterface interface){
    HttpUtils.fetchData(url)
        .then((Map<String, dynamic> map){
      interface.onSuccess(prefix.ListItemModel.fromJson(map));
    });
  }
}