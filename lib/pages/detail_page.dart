import 'package:flutter/material.dart';
import 'package:myapp/model/list_item_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail_page';

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final ListDatas args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(args.cname)),
      body: WebView(
//        initialUrl: 'https://www.baidu.com/',
      initialUrl: args.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
//      body: Center(
//        child: RaisedButton(
//            shape: Border.all(style: BorderStyle.none),
//            color: Colors.white,
//            child: Text(args.title),
//            onPressed: () => Navigator.pop(context)),
//      ),
    );
  }
}
