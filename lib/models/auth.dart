import 'package:supabase_flutter/supabase_flutter.dart';

class AuthData {
  final User? user;
  final Session? session;
  final bool loading;

  AuthData({this.user, this.session, this.loading = false});

  factory AuthData.initial() {
    return AuthData(user: null, loading: false);
  }

  AuthData copyWith({User? user, Session? session, bool? loading}) {
    return AuthData(
      user: user ?? this.user,
      session: session ?? this.session,
      loading: loading ?? this.loading,
    );
  }
}
