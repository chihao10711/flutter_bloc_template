import 'package:flutter_envify/flutter_envify.dart';

part 'env.g.dart';

@Envify(path: '.env')
abstract class Env {
  static const String url = _Env.url;
  static const String socket = _Env.socket;
  static const String xAuth = _Env.xAuth;
}
