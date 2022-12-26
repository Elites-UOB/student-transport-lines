import 'package:get/get.dart';
import 'package:student_transport_lines/app/data/models/City.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HelperService extends GetxService {
  static final _supabase = Supabase.instance;

  Future getCities() async {
    final data = await _supabase.client
        .from('cities')
        .select('id,name,provinces(id,name)');
    return data;
  }

  Future getProvinces() async {
    final data = await _supabase.client.from('provinces').select('id,name');
    return data;
  }

  Future getUniversities() async {
    final data = await _supabase.client.from('universities').select('id,name');
    return data;
  }

  Future getColleges() async {
    final data = await _supabase.client.from('colleges').select('id,name');
    return data;
  }

  Future getPorfile() async {
    final userId = _supabase.client.auth.currentUser!.id;
    final data = await _supabase.client
        .from('porfiles')
        .select('*')
        .eq('id', userId)
        .single();
    return data;
  }
}
