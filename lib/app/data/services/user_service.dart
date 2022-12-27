import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService extends GetxService {
  static final _supabase = Supabase.instance.client;
  final user = _supabase.auth.currentUser;

  //get Porfile
  Future getPorfile() async {
    final data =
        await _supabase.from('porfiles').select('*').eq('id', user!.id);
    return data;
  }
}
