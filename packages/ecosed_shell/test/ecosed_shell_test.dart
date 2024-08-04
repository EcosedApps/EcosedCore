import 'package:flutter_test/flutter_test.dart';
import 'package:ecosed_shell/ecosed_shell.dart';
import 'package:ecosed_shell/ecosed_shell_platform_interface.dart';
import 'package:ecosed_shell/ecosed_shell_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEcosedShellPlatform
    with MockPlatformInterfaceMixin
    implements EcosedShellPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final EcosedShellPlatform initialPlatform = EcosedShellPlatform.instance;

  test('$MethodChannelEcosedShell is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEcosedShell>());
  });

  test('getPlatformVersion', () async {
    EcosedShell ecosedShellPlugin = EcosedShell();
    MockEcosedShellPlatform fakePlatform = MockEcosedShellPlatform();
    EcosedShellPlatform.instance = fakePlatform;

    expect(await ecosedShellPlugin.getPlatformVersion(), '42');
  });
}
