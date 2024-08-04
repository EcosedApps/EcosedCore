import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ecosed_shell_platform_interface.dart';

/// An implementation of [EcosedShellPlatform] that uses method channels.
class MethodChannelEcosedShell extends EcosedShellPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ecosed_shell');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
