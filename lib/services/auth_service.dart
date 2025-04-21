import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _googleSignIn = GoogleSignIn(
  clientId: '834769647131-aslujdr31a7embmltochgiiqha7eisnd.apps.googleusercontent.com',
  scopes: ['email', 'profile'],
);


  Future<bool> signInWithGoogle() async {
  try {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      print('Login cancelado');
      return false;
    }

    final googleAuth = await googleUser.authentication;

    final idToken = googleAuth.idToken;
    final accessToken = googleAuth.accessToken;

    if (idToken != null && accessToken != null) {
      final response = await Supabase.instance.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      if (response.user != null) {
        print('Login correcto: ${response.user!.email}');
        return true; // 🔥 Login exitoso
      } else {
        print('Login fallido en Supabase');
        return false;
      }
    } else {
      print('ID Token o Access Token nulo');
      return false;
    }
  } catch (e) {
    print('Error en Google Sign-In: $e');
    return false;
  }
}
}
