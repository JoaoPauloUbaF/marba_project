import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tuple/tuple.dart';

part 'notification_view_model.g.dart';

@riverpod
class NotificationsViewModel extends _$NotificationsViewModel {
  @override
  Tuple4<bool, bool, bool, bool> build() {
    return const Tuple4<bool, bool, bool, bool>(false, false, false, false);
  }

  void toggleOrderNotifications(bool value) {
    final newState = Tuple4<bool, bool, bool, bool>(
        value, state.item2, state.item3, state.item4);
    state = newState;
  }

  void toggleEmailNotifications(bool value) {
    final newState = Tuple4<bool, bool, bool, bool>(
        state.item1, value, state.item3, state.item4);
    state = newState;
  }

  void togglePushNotifications(bool value) {
    final newState = Tuple4<bool, bool, bool, bool>(
        state.item1, state.item2, value, state.item4);
    state = newState;
  }

  void toggleWhatsappNotifications(bool value) {
    final newState = Tuple4<bool, bool, bool, bool>(
        state.item1, state.item2, state.item3, value);
    state = newState;
  }
}
