import 'package:architecture_template/common/env/build_type.dart';
import 'package:architecture_template/common/env/config.dart';
import 'package:architecture_template/common/env/debug_options.dart';
import 'package:architecture_template/common/env/environment.dart';
import 'package:architecture_template/common/runner.dart';

void main() {
  Environment.init(
    buildType: BuildType.dev,
    config: const Config(
      title: 'ENV Flutter application template with Riverpod',
      debugOptions: DebugOptions(),
      baseUrl: '',
    ),
  );

  run();
}
