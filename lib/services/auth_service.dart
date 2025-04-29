import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  Future<AuthResponse> googleSignIn() async {
    const webClientId     = '834769647131-aslujdr31a7embmltochgiiqha7eisnd.apps.googleusercontent.com';
    const androidClientId = '834769647131-4e3rqon29aukc0r29dv2eccq21ntmroq.apps.googleusercontent.com';

    final googleSignIn = kIsWeb
      ? GoogleSignIn(
          clientId: webClientId,        
          scopes: ['email', 'profile'],
        )
      : GoogleSignIn(
          clientId: androidClientId,
          serverClientId: webClientId,
          scopes: ['email', 'profile'],
        );

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw 'Login cancelado';
    }

    final auth = await googleUser.authentication;
    final accessToken = auth.accessToken;
    final idToken     = auth.idToken;

    if (accessToken == null) throw 'No Access Token found.';
    if (idToken     == null) throw 'No ID Token found.';

    return Supabase.instance.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }
}
