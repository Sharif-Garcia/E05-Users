import 'package:flutter_application_27/models/user.dart';
import 'package:flutter_application_27/services/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});
final hairColorsProvider = FutureProvider<List<String>>((ref) {
  final service = ref.watch(userServiceProvider);

  return service.getHariColor();
});

class ColorSeleccionado extends Notifier<String?> {
  @override
  String? build() => null;

  void seleccionar(String? color) {
    state = (state == color) ? null : color;
  }
}

final colorSeleccionadoProvaider = NotifierProvider<ColorSeleccionado, String?>(
  ColorSeleccionado.new,
);
final usersProvaider = FutureProvider<List<User>>((ref) {
  final service = ref.watch(userServiceProvider);
  final color = ref.watch(colorSeleccionadoProvaider);
  return color == null
      ? service.getUsers()
      : service.getUsersByHairColor(color);
});

final userByIdProvaider = FutureProvider.family<User, int>((ref, id) {
  final service = ref.watch(userServiceProvider);
  return service.getUserById(id);
});
