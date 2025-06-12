import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  void sendEmailTo(String emailAddress,String jobTitle) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
      query: Uri.encodeFull(
          'subject=PaylaşApp&body=Merhaba, size $jobTitle başlıklı ilanınız için ulaşmak istiyorum.'),
    );

    if (!await launchUrl(emailUri, mode: LaunchMode.externalApplication)) {
      throw 'E-posta uygulaması açılamadı';
    }
  }

  void openDialerWithNumber(String phoneNumber) async {
    final Uri telUri = Uri(scheme: 'tel', path: phoneNumber);

    if (!await launchUrl(telUri, mode: LaunchMode.externalApplication)) {
      throw 'Numara açılamadı';
    }
  }
}
