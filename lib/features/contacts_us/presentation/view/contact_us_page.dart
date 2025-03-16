import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lighthouse_web_app/core/resources/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class UltimateContactPage extends StatelessWidget {
  const UltimateContactPage({Key? key}) : super(key: key);

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
      throw Exception('Could not launch $url');
    }
  }

  /// Builds an elegant glassmorphic contact card.
  Widget _buildContactCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String detail,
    required String url,
  }) {
    return InkWell(
      onTap: () async {
        try {
          await _launchUrl(url);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error launching: $e')),
          );
        }
      },
      borderRadius: BorderRadius.circular(24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white.withOpacity(0.8),
              border: Border.all(color: Colors.white.withOpacity(0.6)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(4, 4),
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [orange, yellow],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Icon(icon, size: 30, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: navy,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        detail,
                        style: const TextStyle(
                          fontSize: 14,
                          color: grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 18, color: navy),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Define contact methods data.
    final List<Map<String, dynamic>> contacts = [
      {
        'icon': Icons.web,
        'title': 'Website',
        'detail': 'lighthouse-hub.com',
        'url': 'https://lighthouse-hub.com',
      },
      {
        'icon': Icons.email,
        'title': 'Email',
        'detail': 'cws.lighthouse@gmail.com',
        'url': 'mailto:cws.lighthouse@gmail.com',
      },
      {
        'icon': Icons.phone,
        'title': 'Phone',
        'detail': '+963113315313',
        'url': 'tel:+963113315313',
      },
      {
        'icon': Icons.smartphone,
        'title': 'Mobile',
        'detail': '+963949879873',
        'url': 'tel:+963949879873',
      },
      {
        'icon': Icons.sms,
        'title': 'SMS',
        'detail': '963949879873',
        'url': 'sms:963949879873',
      },
      {
        'icon': Icons.call_missed_outgoing,
        'title': 'WhatsApp',
        'detail': '+963938406717',
        'url': 'https://wa.me/963938406717',
      },
      {
        'icon': Icons.camera_alt,
        'title': 'Instagram',
        'detail': 'mhd_anas_barakat',
        'url': 'https://www.instagram.com/mhd_anas_barakat',
      },
      {
        'icon': Icons.facebook,
        'title': 'Facebook',
        'detail': 'facebook.com',
        'url': 'https://www.facebook.com/',
      },
      {
        'icon': Icons.send,
        'title': 'Telegram',
        'detail': '@Anas_ba_15',
        'url': 'https://t.me/Anas_ba_15',
      },
    ];

    // Determine if the device is desktop.
    final bool isDesktop = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      backgroundColor: lightGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              // Custom curved header.
              ClipPath(
                clipper: HeaderClipper(),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [orange, yellow],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Contact Us",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Content: Cards in grid for desktop, list for mobile.
              Expanded(
                child: isDesktop
                    ? GridView.builder(
                        padding: const EdgeInsets.only(top: 16),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 5,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          final contact = contacts[index];
                          return _buildContactCard(
                            context: context,
                            icon: contact['icon'] as IconData,
                            title: contact['title'] as String,
                            detail: contact['detail'] as String,
                            url: contact['url'] as String,
                          );
                        },
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(top: 16),
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          final contact = contacts[index];
                          return _buildContactCard(
                            context: context,
                            icon: contact['icon'] as IconData,
                            title: contact['title'] as String,
                            detail: contact['detail'] as String,
                            url: contact['url'] as String,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A custom clipper for the curved header.
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // Start at top-left.
    path.lineTo(0, size.height - 50);
    // Create a smooth curve.
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
