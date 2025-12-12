import 'package:hive_flutter/hive_flutter.dart';

class CacheService {
  final Map<String, Box> _boxes = {};

  Box? getBox(String boxName) => _boxes[boxName];

  Future init() async {
    await Hive.initFlutter();
  }

  Future<void> openBox(String boxName) async {
    if (!_boxes.containsKey(boxName)) {
      _boxes[boxName] = await Hive.openBox(boxName);
    }
  }

  Future<void> put<T>({
    required String boxName,
    required String key,
    required T value,
  }) async {
    try {
      await openBox(boxName);
      await getBox(boxName)?.put(key, value);
    } catch (_) {}
  }

  Future<T?> get<T>({
    required String boxName,
    required String key,
    T? defaultValue,
  }) async {
    try {
      await openBox(boxName);
      return getBox(boxName)?.get(key, defaultValue: defaultValue);
    } catch (_) {
      return defaultValue;
    }
  }

  Future<void> delete({required String boxName, required String key}) async {
    try {
      await openBox(boxName);
      await getBox(boxName)?.delete(key);
    } catch (_) {}
  }

  Future<void> clear({required String boxName}) async {
    try {
      await openBox(boxName);
      await getBox(boxName)?.clear();
    } catch (_) {}
  }
}
