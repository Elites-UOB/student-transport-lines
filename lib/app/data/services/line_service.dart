// import 'dart:ffi';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LineService extends GetxService {
  static final _supabase = Supabase.instance.client;
  final user = _supabase.auth.currentUser;

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
    final userId = _supabase.auth.currentUser!.id;
    final profile = await getPorfile();

    final data = await _supabase.from('lines').insert({
      'profile_id': userId,
      'car_model': "carModel",
      'university_id': 1,
      'college_id': 1,
      'city': 'asdasd', //profile[0]['city'],
      'province': 'asd', //profile[0]['province'],
      'price': "price",
      'pass_count': "passCount",
      'car_pass_count': "carPassCount",
      'type': '1',
    }).select('*');
    return data;
  }

  //Update Line
  Future updateLine(String name, String university, String collage, String time,
      String seats, String price, String driverId, String lineId) async {
    final data = await _supabase.from('lines').update({
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
    final data = await _supabase.from('lines').delete().eq('id', lineId);
    return data;
  }

  //get Porfile
  Future getPorfile() async {
    final data =
        await _supabase.from('porfiles').select('*').eq('id', user!.id);
    return data;
  }

  //Get All Lines
  Future getLines() async {
    final data = await _supabase
        .from('lines')
        .select(
            "car_model,state,type,price,pass_count,car_pass_count,profiles(id,full_name,avatar_url,phone,telegarm),colleges(name),universities(name))")
        .eq('state', 'true');
    return data;
  }
}
