///// URL STRUCTURE
class ShortUrl {
  int _id;
  String _url;
  String _origUrl;
  bool _copyOrNot;

  ShortUrl(this._id, this._url, this._origUrl, this._copyOrNot);

  /// setter
  ///
  set id(int id) {
    this._id = id;
  }

  set url(String url) {
    this._url = url;
  }

  set origUrl(String origUrl) {
    this._origUrl = origUrl;
  }

  set copyOrNot(bool copyOrNot) {
    this._copyOrNot = copyOrNot;
  }

  ///// getter

  int get id => this._id;

  String get url => this._url;

  String get origUrl => this._origUrl;

  bool get copyOrNot => this._copyOrNot;
}
