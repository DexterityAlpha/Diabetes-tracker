import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();
final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

const AUTH0_DOMAIN = 'diabit.us.auth0.com';
const AUTH0_CLIENT_ID = 'VMnyv0QrA882NYaZL60ABEFQVYsFL7gO';

const AUTH0_REDIRECT_URI = 'com.auth0.diabetestracker://login-callback';
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';

class Authentication with ChangeNotifier {
  bool isBusy = false;
  bool isLoggedIn = false;
  String errorMessage;
  String name;
  String picture;

  Map<String, dynamic> parseIdToken(String idToken) {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  }

//Getting User Details
  Future<Map> getUserDetails(String accessToken) async {
    final url = Uri.parse('https://$AUTH0_DOMAIN/userinfo');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }

// Sign In Function
  Future<void> loginAction() async {
    isBusy = true;
    errorMessage = '';

    try {
      final AuthorizationTokenResponse result =
          await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(AUTH0_CLIENT_ID, AUTH0_REDIRECT_URI,
            issuer: 'https://$AUTH0_DOMAIN',
            scopes: ['openid', 'profile', 'offline_access'],
            promptValues: ['login']),
      );
      print(result);
      final idToken = parseIdToken(result.idToken.toString());
      final profile = await getUserDetails(result.accessToken.toString());

      await secureStorage.write(
          key: 'refresh_token', value: result.refreshToken);

      isBusy = false;
      isLoggedIn = true;
      notifyListeners();
      name = idToken['name'];
      picture = profile['picture'];
    } catch (e, s) {
      print('login error: $e - stack: $s');

      isBusy = false;
      isLoggedIn = false;
      errorMessage = e.toString();
    }
  }

  bool get isAuth {
    return name != null;
  }

  void logoutAction() async {
    await secureStorage.delete(key: 'refresh_token');

    isLoggedIn = false;
    isBusy = false;
    notifyListeners();
  }

  void initAction() async {
    final storedRefreshToken = await secureStorage.read(key: 'refresh_token');
    if (storedRefreshToken == null) return;

    isBusy = true;

    try {
      final response = await appAuth.token(TokenRequest(
        AUTH0_CLIENT_ID,
        AUTH0_REDIRECT_URI,
        issuer: AUTH0_ISSUER,
        refreshToken: storedRefreshToken,
      ));

      final idToken = parseIdToken(response.idToken.toString());
      final profile = await getUserDetails(response.accessToken.toString());

      secureStorage.write(key: 'refresh_token', value: response.refreshToken);

      isBusy = false;
      isLoggedIn = true;
      name = idToken['name'];
      picture = profile['picture'];
    } catch (e, s) {
      print('error on refresh token: $e - stack: $s');
      logoutAction();
    }
  }
}
