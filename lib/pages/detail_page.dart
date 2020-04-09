import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/dao/detail_dao.dart';
import 'package:myapp/dao/home_dao.dart';
import 'package:myapp/inter/http_interface.dart';
import 'package:myapp/model/detail_model.dart';
import 'package:myapp/model/list_item_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail_page';
  final ListDatas args;

  DetailPage(this.args);

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  Datas _detailModel;

  @override
  void initState() {
    super.initState();
    DetailDao.fetchDetailData(
          widget.args.url, HttpInterface(onSuccess: onDetailDataSuccess));
  }

  onDetailDataSuccess(Object model) {
    DetailModel dmodel = model;
    setState(() {
      _detailModel = dmodel.datas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.args.cname), centerTitle: true),
      body: _detailModel != null
          ? Builder(
              builder: (context) => WebView(
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (webViewController) {
//            _controller.complete(webViewController);
                  _loadHtml(webViewController);
                },
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  _loadHtml(WebViewController controller) {

    String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<div class="mainBox">
    <div class="mainDetailed">
        <div class="titBox">
            <h2>${_detailModel.title}</h2>
            <div class="sourceBox">
                <div style="color:#474F81">来源：${_detailModel.source}</div>
                <div style="margin-top">${_detailModel.time}</div>
            </div>
        </div>
        <div class="contentBox">${_detailModel.body}</div>
    </div>
</div>
</body>
</html>
''';

    final String contentBase64 =
        base64Encode(const Utf8Encoder().convert(kNavigationExamplePage));
    controller.loadUrl('data:text/html;base64,$contentBase64');
  }
}
