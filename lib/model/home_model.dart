class HomeChannelModel {
  List<ChannelList> _channelList;

  HomeChannelModel({List<ChannelList> channelList}) {
    this._channelList = channelList;
  }

  List<ChannelList> get channelList => _channelList;

  set channelList(List<ChannelList> channelList) => _channelList = channelList;

  HomeChannelModel.fromJson(Map<String, dynamic> json) {
    if (json['channel_list'] != null) {
      _channelList = new List<ChannelList>();
      json['channel_list'].forEach((v) {
        _channelList.add(new ChannelList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._channelList != null) {
      data['channel_list'] = this._channelList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChannelList {
  String _cid;
  String _cname;
  String _url;
  List<ChannelList> _channelList;

  ChannelList(
      {String cid, String cname, String url, List<ChannelList> channelList}) {
    this._cid = cid;
    this._cname = cname;
    this._url = url;
    this._channelList = channelList;
  }

  String get cid => _cid;

  set cid(String cid) => _cid = cid;

  String get cname => _cname;

  set cname(String cname) => _cname = cname;

  String get url => _url;

  set url(String url) => _url = url;

  List<ChannelList> get channelList => _channelList;

  set channelList(List<ChannelList> channelList) => _channelList = channelList;

  ChannelList.fromJson(Map<String, dynamic> json) {
    _cid = json['cid'];
    _cname = json['cname'];
    _url = json['url'];
    if (json['channel_list'] != null) {
      _channelList = new List<ChannelList>();
      json['channel_list'].forEach((v) {
        _channelList.add(new ChannelList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this._cid;
    data['cname'] = this._cname;
    data['url'] = this._url;
    if (this._channelList != null) {
      data['channel_list'] = this._channelList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChannelListItem {
  String _cid;
  String _cname;
  String _url;

  ChannelListItem({String cid, String cname, String url}) {
    this._cid = cid;
    this._cname = cname;
    this._url = url;
  }

  String get cid => _cid;

  set cid(String cid) => _cid = cid;

  String get cname => _cname;

  set cname(String cname) => _cname = cname;

  String get url => _url;

  set url(String url) => _url = url;

  ChannelListItem.fromJson(Map<String, dynamic> json) {
    _cid = json['cid'];
    _cname = json['cname'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this._cid;
    data['cname'] = this._cname;
    data['url'] = this._url;
    return data;
  }
}
