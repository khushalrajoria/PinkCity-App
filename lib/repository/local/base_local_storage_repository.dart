import 'package:hive/hive.dart';
import '../../models/place_model.dart';
abstract class BaseLocalStorageRepository {
  Future<Box> openBox();
  Place? getPlace(Box box);
  Future<void> addPlace(Box box, Place place);
  Future<void> clearBox(Box box);
}