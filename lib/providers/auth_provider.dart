import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterblognew/models/auth.dart';

class AuthNotifier extends Notifier<AuthData> {
  @override
  AuthData build() {
    return AuthData.initial();
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthData>(AuthNotifier.new);
