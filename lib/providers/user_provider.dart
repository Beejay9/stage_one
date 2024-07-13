import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stage_one/notifiers/user_notifier.dart';

final userProvider = ChangeNotifierProvider<User>((ref) {
  return User();
});