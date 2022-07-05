import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      return <BiometricType>[];
    }
  }

// static Future<bool> biometrics() async {
//     final LocalAuthentication _localAuth = LocalAuthentication();
//     bool authenticated = false;
//     try {
//       authenticated = await _localAuth.authenticateWithBiometrics(
//         localizedReason: 'Scan your fingerprint to authenticate',
//         useErrorDialogs: true,
//         stickyAuth: false
//       );
//     } on PlatformException
//     catch(e) {
//       print(e);
//     }
//     return authenticated;
//   }
//   static Future<bool> authenticate() async {
//     final isAvailable = await hasBiometrics();
//     if (!isAvailable) return false;

//     try {
//       return await _auth.authenticateWithBiometrics(
//         localizedReason: 'Scan Fingerprint to Authenticate',
//         useErrorDialogs: true,
//         stickyAuth: true,
//       );
//     } on PlatformException catch (e) {
//       return false;
//     }
//   }
}
