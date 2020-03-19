
import 'package:flutter/foundation.dart';

enum ViewState { Idle, Busy }

class BaseModel extends ChangeNotifier{
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setViewState(ViewState state) {
    _state = state;
    notifyListeners();
  }
}