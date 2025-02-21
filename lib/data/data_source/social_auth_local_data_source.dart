import 'dart:io';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:globenotes/app/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SocialAuthLocalDataSource {
  Future<String?> signInWithGoogle();

  Future<String?> signInWithFacebook();
}

class SocialAuthLocalDataSourceImpl implements SocialAuthLocalDataSource {
  late final GoogleSignIn _googleSignIn;

  SocialAuthLocalDataSourceImpl() {
    if (Platform.isAndroid) {
      _googleSignIn = GoogleSignIn(
        scopes: ['email', 'profile'],
        serverClientId: Constants.webGoogleClientId,
      );
    } else if (Platform.isIOS) {
      _googleSignIn = GoogleSignIn(
        clientId: Constants.iosGoogleClientId,
        scopes: ['email', 'profile'],
      );
    } else {
      _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
    }
  }

  @override
  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      return googleAuth.idToken;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );
      if (result.status == LoginStatus.success) {
        final accessToken = result.accessToken;
        return accessToken?.token;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
