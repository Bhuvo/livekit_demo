import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

const String defaultTTL = '6h';

class AccessToken {
  late String apiKey;
  late String apiSecret;
  late Map<String, dynamic> grants;
  late String? identity;
  late String ttl;
  late Map<String, dynamic>? metadata;
  late String? name;

  AccessToken(String apiKey, String apiSecret, {String? identity, String? ttl, Map<String, dynamic>? metadata, String? name}) {
    this.apiKey = apiKey.isNotEmpty ? apiKey : throw Exception('api-key must be set');
    this.apiSecret = apiSecret.isNotEmpty ? apiSecret : throw Exception('api-secret must be set');
    this.grants = {};
    this.identity = identity;
    this.ttl = ttl ?? defaultTTL;
    if (metadata != null) {
      this.metadata = metadata;
    }
    if (name != null) {
      this.name = name;
    }
  }

  void addGrant(Map<String, dynamic> grant) {
    grants['video'] = {...grants['video'] ?? {}, ...grant};
  }

  set setMetadata(Map<String, dynamic>? md) {
    grants['metadata'] = md;
  }

  set setName(String? name) {
    grants['name'] = name;
  }

  String get sha256 {
    return grants['sha256'];
  }

  set sha256(String sha) {
    grants['sha256'] = sha;
  }

  Future<String> toJwt() async {
    final secret = apiSecret;
    final jwt = JWT(grants, issuer: apiKey, subject: identity,);

    final jwtToken = jwt.sign(SecretKey(secret), algorithm: JWTAlgorithm.HS256, expiresIn: const Duration(days: 1));
    return jwtToken.toString();
  }

  int _parseTTL() {
    if (ttl.endsWith('s')) {
      return int.parse(ttl.substring(0, ttl.length - 1));
    } else if (ttl.endsWith('m')) {
      return int.parse(ttl.substring(0, ttl.length - 1)) * 60;
    } else if (ttl.endsWith('h')) {
      return int.parse(ttl.substring(0, ttl.length - 1)) * 3600;
    } else {
      throw Exception('Invalid TTL format');
    }
  }
}

class TokenVerifier {
  late String apiKey;
  late String apiSecret;

  TokenVerifier(String apiKey, String apiSecret) {
    this.apiKey = apiKey.isNotEmpty ? apiKey : throw Exception('api-key must be set');
    this.apiSecret = apiSecret.isNotEmpty ? apiSecret : throw Exception('api-secret must be set');
  }

  Future<Map<String, dynamic>> verify(String token) async {
    final secret = apiSecret;
    final jwt = JWT.verify(token, SecretKey(secret), issuer: apiKey);

    if (jwt == null) {
      throw Exception('invalid token');
    }

    return jwt.payload;
  }
}