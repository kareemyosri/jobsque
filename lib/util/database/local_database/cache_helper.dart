

import 'package:shared_preferences/shared_preferences.dart';

import '../../enums.dart';



class CashHelper{

  static SharedPreferences? preferences;

 static Future<void> init() async{
    preferences= await SharedPreferences.getInstance();
  }

  static putString({required MySharedKeys key, required dynamic value}) async{
   await preferences?.setString(key.name, value);
  }
  static putDouble({required MySharedKeys key, required double value}) async{
    await preferences?.setDouble(key.name, value);
  }
  static putBool({required MySharedKeys key, required bool value}) async{
    await preferences?.setBool(key.name, value);
  }


  static getString({required MySharedKeys key}) {
     return preferences?.getString(key.name)?? "";
  }
  static getDouble({required MySharedKeys key}) {
    return preferences?.getDouble(key.name)?? 0.0;
  }
  static getBoolean({required MySharedKeys key}) {
    return preferences?.getBool(key.name)?? false;
  }

  static Future<void> removeCacheKey({required MySharedKeys key}) async{
    await preferences?.remove(key.name);
  }
  static Future<void> clearCache() async{
    await preferences?.clear();
  }
}