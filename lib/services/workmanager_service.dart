import 'package:shared_preferences/shared_preferences.dart';

class BackGroundWorkService {
  loadCounterValue(int value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt('BackGroundCounterValue', value);
  }

  Future<int> getBackGroundCounterValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int counterValue = pref.getInt('BackGroundCounterValue') ?? 0;
    return counterValue;
  }
}
