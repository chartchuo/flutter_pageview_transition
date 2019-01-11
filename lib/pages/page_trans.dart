import 'package:rxdart/subjects.dart';

class PageTransitionSubject {
  static final PageTransitionSubject _instant = PageTransitionSubject._();
  BehaviorSubject<double> _subject;
  factory PageTransitionSubject() => PageTransitionSubject._instant;

  PageTransitionSubject._() {
    this._subject = BehaviorSubject();
  }
  update(double state) => this._subject.add(state);

  Stream<double> filter(double pageId) {
    return this._subject.stream.expand((page) => [page]).asBroadcastStream();
  }

  dispose() {
    _subject.close();
  }
}
