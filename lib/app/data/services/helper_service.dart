import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/Auth.dart';

class HelperService extends GetxService {
  static final _supabase = Supabase.instance;
  static final error = false;

  Future fatch() async {
    final data = await _supabase.client
        .from('cities')
        .select('id,name,provinces(id,name)');
    return data;
  }
}
