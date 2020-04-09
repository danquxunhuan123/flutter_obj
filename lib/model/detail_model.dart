class DetailModel {
  Datas _datas;

  DetailModel({Datas datas}) {
    this._datas = datas;
  }

  Datas get datas => _datas;
  set datas(Datas datas) => _datas = datas;

  DetailModel.fromJson(Map<String, dynamic> json) {
    _datas = json['datas'] != null ? new Datas.fromJson(json['datas']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._datas != null) {
      data['datas'] = this._datas.toJson();
    }
    return data;
  }
}

class Datas {
  String _cid;
  String _cname;
  String _docid;
  String _title;
  String _source;
  String _author;
  String _articletype;
  String _listimgtype;
  String _keywords;
  String _time;
  String _body;
  List<Images> _images;
  String _abs;
  String _shareurl;
  String _videourl;

  Datas(
      {String cid,
        String cname,
        String docid,
        String title,
        String source,
        String author,
        String articletype,
        String listimgtype,
        String keywords,
        String time,
        String body,
        List<Null> bodyimgs,
        List<Images> images,
        String abs,
        String shareurl,
        String videourl}) {
    this._cid = cid;
    this._cname = cname;
    this._docid = docid;
    this._title = title;
    this._source = source;
    this._author = author;
    this._articletype = articletype;
    this._listimgtype = listimgtype;
    this._keywords = keywords;
    this._time = time;
    this._body = body;
    this._images = images;
    this._abs = abs;
    this._shareurl = shareurl;
    this._videourl = videourl;
  }

  String get cid => _cid;
  set cid(String cid) => _cid = cid;
  String get cname => _cname;
  set cname(String cname) => _cname = cname;
  String get docid => _docid;
  set docid(String docid) => _docid = docid;
  String get title => _title;
  set title(String title) => _title = title;
  String get source => _source;
  set source(String source) => _source = source;
  String get author => _author;
  set author(String author) => _author = author;
  String get articletype => _articletype;
  set articletype(String articletype) => _articletype = articletype;
  String get listimgtype => _listimgtype;
  set listimgtype(String listimgtype) => _listimgtype = listimgtype;
  String get keywords => _keywords;
  set keywords(String keywords) => _keywords = keywords;
  String get time => _time;
  set time(String time) => _time = time;
  String get body => _body;
  set body(String body) => _body = body;
  List<Images> get images => _images;
  set images(List<Images> images) => _images = images;
  String get abs => _abs;
  set abs(String abs) => _abs = abs;
  String get shareurl => _shareurl;
  set shareurl(String shareurl) => _shareurl = shareurl;
  String get videourl => _videourl;
  set videourl(String videourl) => _videourl = videourl;

  Datas.fromJson(Map<String, dynamic> json) {
    _cid = json['cid'];
    _cname = json['cname'];
    _docid = json['docid'];
    _title = json['title'];
    _source = json['source'];
    _author = json['author'];
    _articletype = json['articletype'];
    _listimgtype = json['listimgtype'];
    _keywords = json['keywords'];
    _time = json['time'];
    _body = json['body'];
    if (json['images'] != null) {
      _images = new List<Images>();
      json['images'].forEach((v) {
        _images.add(new Images.fromJson(v));
      });
    }
    _abs = json['abs'];
    _shareurl = json['shareurl'];
    _videourl = json['videourl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this._cid;
    data['cname'] = this._cname;
    data['docid'] = this._docid;
    data['title'] = this._title;
    data['source'] = this._source;
    data['author'] = this._author;
    data['articletype'] = this._articletype;
    data['listimgtype'] = this._listimgtype;
    data['keywords'] = this._keywords;
    data['time'] = this._time;
    data['body'] = this._body;
    if (this._images != null) {
      data['images'] = this._images.map((v) => v.toJson()).toList();
    }
    data['abs'] = this._abs;
    data['shareurl'] = this._shareurl;
    data['videourl'] = this._videourl;
    return data;
  }
}

class Images {
  String _src;

  Images({String src}) {
    this._src = src;
  }

  String get src => _src;
  set src(String src) => _src = src;

  Images.fromJson(Map<String, dynamic> json) {
    _src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['src'] = this._src;
    return data;
  }
}
