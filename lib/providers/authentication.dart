import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();
final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

const AUTH0_DOMAIN = 'diabit.us.auth0.com';
const AUTH0_CLIENT_ID = 'VMnyv0QrA882NYaZL60ABEFQVYsFL7gO';

const AUTH0_REDIRECT_URI = 'com.auth0.diabetestracker://login-callback';
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';
