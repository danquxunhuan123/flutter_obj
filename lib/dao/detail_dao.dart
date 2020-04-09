import 'package:myapp/http/http_util.dart';
import 'package:myapp/inter/http_interface.dart';
import 'package:myapp/model/detail_model.dart';

class DetailDao{
  static fetchDetailData(String url,HttpInterface interface){
    HttpUtils.fetchData(url)
        .then((Map<String, dynamic> map){
      interface.onSuccess(DetailModel.fromJson(map));
    });
  }
}