class Global {
  static final Global _singleton = Global._internal();

  factory Global() {
    return _singleton;
  }

  Global._internal();

  Future userID;

  static bool stocks = false;
  static bool bonds = false;
  static bool etfs = false;

  bool isLoggedIn = false;
  bool isGuest = false;
}