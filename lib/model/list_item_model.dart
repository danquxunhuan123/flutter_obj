class ListItemModel {
  int _nowPage;
  int _countPage;
  String _date;
  List<ListDatas> _listDatas;

  ListItemModel(
      {int nowPage, int countPage, String date, List<ListDatas> listDatas}) {
    this._nowPage = nowPage;
    this._countPage = countPage;
    this._date = date;
    this._listDatas = listDatas;
  }

  int get nowPage => _nowPage;
  set nowPage(int nowPage) => _nowPage = nowPage;
  int get countPage => _countPage;
  set countPage(int countPage) => _countPage = countPage;
  String get date => _date;
  set date(String date) => _date = date;
  List<ListDatas> get listDatas => _listDatas;
  set listDatas(List<ListDatas> listDatas) => _listDatas = listDatas;

  ListItemModel.fromJson(Map<String, dynamic> json) {
    _nowPage = json['nowPage'];
    _countPage = json['countPage'];
    _date = json['date'];
    if (json['list_datas'] != null) {
      _listDatas = new List<ListDatas>();
      json['list_datas'].forEach((v) {
        _listDatas.add(new ListDatas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nowPage'] = this._nowPage;
    data['countPage'] = this._countPage;
    data['date'] = this._date;
    if (this._listDatas != null) {
      data['list_datas'] = this._listDatas.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListDatas {
  String _cid;
  String _cname;
  String _docid;
  String _title;
  String _source;
  String _author;
  String _articletype;
  String _listimgtype;
  String _time;
  List<Images> _images;
  String _abs;
  String _url;
  String _videourl;

  ListDatas(
      {String cid,
        String cname,
        String docid,
        String title,
        String source,
        String author,
        String articletype,
        String listimgtype,
        String time,
        List<Images> images,
        String abs,
        String url,
        String videourl}) {
    this._cid = cid;
    this._cname = cname;
    this._docid = docid;
    this._title = title;
    this._source = source;
    this._author = author;
    this._articletype = articletype;
    this._listimgtype = listimgtype;
    this._time = time;
    this._images = images;
    this._abs = abs;
    this._url = url;
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
  String get time => _time;
  set time(String time) => _time = time;
  List<Images> get images => _images;
  set images(List<Images> images) => _images = images;
  String get abs => _abs;
  set abs(String abs) => _abs = abs;
  String get url => _url;
  set url(String url) => _url = url;
  String get videourl => _videourl;
  set videourl(String videourl) => _videourl = videourl;

  ListDatas.fromJson(Map<String, dynamic> json) {
    _cid = json['cid'];
    _cname = json['cname'];
    _docid = json['docid'];
    _title = json['title'];
    _source = json['source'];
    _author = json['author'];
    _articletype = json['articletype'];
    _listimgtype = json['listimgtype'];
    _time = json['time'];
    if (json['images'] != null) {
      _images = new List<Images>();
      json['images'].forEach((v) {
        _images.add(new Images.fromJson(v));
      });
    }
    _abs = json['abs'];
    _url = json['url'];
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
    data['time'] = this._time;
    if (this._images != null) {
      data['images'] = this._images.map((v) => v.toJson()).toList();
    }
    data['abs'] = this._abs;
    data['url'] = this._url;
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
