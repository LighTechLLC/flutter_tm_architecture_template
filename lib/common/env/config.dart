import 'package:architecture_template/common/env/debug_options.dart';

class Config {
  const Config({
    required this.title,
    required this.debugOptions,
    required this.baseUrl,
  });

  final String title;
  final DebugOptions debugOptions;
  final String baseUrl;
}
