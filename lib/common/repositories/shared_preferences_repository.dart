import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  final SharedPreferences _prefs;

  SharedPreferencesRepository(
    this._prefs,
  ) : assert(_prefs != null);

  Future<bool> writeInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  int readInt(String key) {
    return _prefs.getInt(key);
  }
}
