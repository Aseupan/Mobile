import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {}
}
