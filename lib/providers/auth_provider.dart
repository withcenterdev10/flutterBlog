import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterblognew/models/auth.dart';
import 'package:flutterblognew/db/supabase.dart';
import 'package:flutterblognew/models/auth.dart';

class AuthNotifier extends Notifier<AuthData> {
  @override
  AuthData build() {
    return AuthData.initial();
  }

  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    try {
      final res = await supabase.auth.signInWithPassword(
        password: password,
        email: email,
      );

      print(res);
    } catch (error) {
      print(error);
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final res = await supabase.auth.signUp(password: password, email: email);

      state = state.copyWith(
        user: res.user,
        session: res.session,
        loading: false,
      );
    } catch (error) {
      print(error);
      throw Exception("Failed to sign up");
    }
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthData>(AuthNotifier.new);
