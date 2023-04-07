import 'dart:io';

Future<void> main() async {
  await Future.delayed(const Duration(seconds: 10));
  ProcessResult result = await Process.run('ls', []);
  print(result.stdout);
}
