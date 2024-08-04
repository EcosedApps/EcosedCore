import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ecosed_shell_method_channel.dart';

abstract class EcosedShellPlatform extends PlatformInterface {
  /// Constructs a EcosedShellPlatform.
  EcosedShellPlatform() : super(token: _token);

  static final Object _token = Object();

  static EcosedShellPlatform _instance = MethodChannelEcosedShell();

  /// The default instance of [EcosedShellPlatform] to use.
  ///
  /// Defaults to [MethodChannelEcosedShell].
  static EcosedShellPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EcosedShellPlatform] when
  /// they register themselves.
  static set instance(EcosedShellPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
