import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _getGridView();
  }

  _getGridView() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _getRow(),
          _getRow(),
        ],
      ),
    );
  }

  _getRow() {
    return Row(
      children: <Widget>[_getRowItem(), _getRowItem(), _getRowItem()],
    );
  }

  _getRowItem() {
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
          children: <Widget>[
            Icon(Icons.account_balance),
            Container(
              margin: EdgeInsets.only(left: 5.0),
              child: Text('咨询'),
            )
          ],
        ),
      ),
    );
  }
}
