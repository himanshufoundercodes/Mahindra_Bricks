import 'package:url_launcher/url_launcher.dart';

class CustomLauncher {
  // Common URL Launcher
  static Future<void> launch(String url) async {
    final Uri uri = Uri.parse(url);
    await _launchUri(uri);
  }

  // Phone Call
  static Future<void> call(String phone) async {
    await _launchUri(Uri(scheme: 'tel', path: phone));
  }

  // SMS
  static Future<void> sms(String phone, {String? message}) async {
    final Uri uri = Uri(
      scheme: 'sms',
      path: phone,
      queryParameters: message != null ? {'body': message} : null,
    );
    await _launchUri(uri);
  }

  // Email
  static Future<void> email(
      String email, {
        String? subject,
        String? body,
      }) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      },
    );
    await _launchUri(uri);
  }

  // WhatsApp
  static Future<void> whatsapp(
      String phone, {
        String? message,
      }) async {
    final Uri uri = Uri.https(
      'wa.me',
      '/${phone.replaceAll(RegExp(r'[^0-9]'), '')}',
      {
        if (message != null) 'text': message,
      },
    );
    await _launchUri(uri);
  }

  // Website
  static Future<void> website(String url) async {
    String formattedUrl = url.trim();

    if (!formattedUrl.startsWith('https://') &&
        !formattedUrl.startsWith('http://')) {
      formattedUrl = 'https://$formattedUrl';
    }

    await _launchUri(Uri.parse(formattedUrl));
  }

  // Google Maps Location
  static Future<void> map({
    required double latitude,
    required double longitude,
  }) async {
    final Uri uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
    );
    await _launchUri(uri);
  }

  // YouTube
  static Future<void> youtube(String videoId) async {
    await _launchUri(
      Uri.parse('https://www.youtube.com/watch?v=$videoId'),
    );
  }

  // Generic App / Deep Link
  static Future<void> app(String url) async {
    await _launchUri(Uri.parse(url));
  }

  // Common Internal Launcher
  static Future<void> _launchUri(Uri uri) async {
    try {
      final bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        throw Exception('Could not launch $uri');
      }
    } catch (e) {
      throw Exception('Launcher Error: $e');
    }
  }
}