class FlutterandoItem {
  String _imageUrl;
  String _title;
  String _subtitle;
  int _counter;

  get imageUrl => _imageUrl;
  set imageUrl(value) => _imageUrl = value;

  get title => _title;
  set title(value) => _title = value;

  get subtitle => _subtitle;
  set subtitle(value) => _subtitle = value;

  get counter => _counter;
  set counter(value) => _counter = value;

  FlutterandoItem(this._imageUrl, this._title, this._subtitle, this._counter);
}
