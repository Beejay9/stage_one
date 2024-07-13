import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stage_one/notifiers/cart_notifier.dart';

final cartProvider = ChangeNotifierProvider<Cart>((ref) {
  return  Cart();
});