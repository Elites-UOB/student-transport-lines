import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/Auth.dart';

class LineService extends GetxService {
  static final _supabase = Supabase.instance;

  //Add New Line
  Future addNewLine(String name, String university, String collage, String time,
      String seats, String price, String driverId) async {
    final data = await _supabase.client.from('lines').insert({
      'name': name,
      'university': university,
      'collage': collage,
      'time': time,
      'seats': seats,
      'price': price,
      'driver_id': driverId,
    }).execute();
    return data;
  }

  //Update Line
  Future updateLine(String name, String university, String collage, String time,
      String seats, String price, String driverId, String lineId) async {
    final data = await _supabase.client.from('lines').update({
      'name': name,
      'university': university,
      'collage': collage,
      'time': time,
      'seats': seats,
      'price': price,
      'driver_id': driverId,
    }).eq('id', lineId);
    return data;
  }

  //Delete Line
  Future deleteLine(String lineId) async {
    final data = await _supabase.client.from('lines').delete().eq('id', lineId);
    return data;
  }

  //Get All Lines
  Future getLines() async {
    final data = await _supabase.client.from('lines').select("*");
    return data;
  }
}
