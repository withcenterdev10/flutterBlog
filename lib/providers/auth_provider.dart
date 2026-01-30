import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterblognew/models/auth.dart';
import 'package:flutterblognew/db/supabase.dart';

class AuthNotifier extends Notifier<AuthData> {
  @override
  AuthData build() {
    return AuthData.initial();
  }

  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(loading: true);
    try {
      final res = await supabase.auth.signInWithPassword(
        password: password,
        email: email,
      );

      state = state.copyWith(
        user: res.user,
        session: res.session,
        loading: false,
      );

      print(res);
    } catch (error) {
      print(error);
      throw Exception("Failed to sign in");
    } finally {
      state = state.copyWith(loading: false);
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      state = state.copyWith(loading: true);
      final res = await supabase.auth.signUp(password: password, email: email);

      state = state.copyWith(
        user: res.user,
        session: res.session,
        loading: false,
      );
    } catch (error) {
      print(error);
      throw Exception("Failed to sign up");
    } finally {
      state = state.copyWith(loading: false);
    }
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthData>(AuthNotifier.new);
