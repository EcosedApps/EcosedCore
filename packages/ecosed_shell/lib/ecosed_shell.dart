import 'ecosed_shell_platform_interface.dart';

Future<void> main() async {}

class EcosedShell {
  Future<String?> getPlatformVersion() {
    return EcosedShellPlatform.instance.getPlatformVersion();
  }
}
