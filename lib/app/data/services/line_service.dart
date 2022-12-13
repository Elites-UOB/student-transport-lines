import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/Auth.dart';

class LineService extends GetxService {
  static final _supabase = Supabase.instance;

  //Add New Line
  Future insert(
    carModel,
    price,
    passCount,
    carPassCount,
    universityId,
    collageId,
    provinceId,
    cityId,
    type,
  ) async {
    final userId = _supabase.client.auth.currentUser!.id;
    final data = await _supabase.client.from('lines').insert({
      'profile_id': userId,
      'car_model': carModel,
      'university_id': universityId ?? 1,
      'college_id': collageId ?? 1,
      'city_id': cityId ?? 1,
      'province_id': provinceId ?? 1,
      'price': price,
      'pass_count': passCount,
      'car_pass_count': carPassCount,
      'type': type ?? 1,
    }).select('*');
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
    final data = await _supabase.client
        .from('lines')
        .select(
            "car_model,state,type,price,pass_count,car_pass_count,cities(name),provinces(name),profiles(id,full_name,avatar_url,phone,telegarm),colleges(name),universities(name))")
        .eq('state', 'true');
    return data;
  }
}
