import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class SearchLinksScreen extends StatelessWidget {
  final String query;

  const SearchLinksScreen({super.key, required this.query});

  static const List<Map<String, dynamic>> _sites = [
    {
      'key': 'trendyol',
      'name': 'Trendyol',
      'color': Color(0xFFFF6B00),
      'bg': Color(0xFFFFF3E0),
      'url': 'https://www.trendyol.com/sr?q=',
      'emoji': '🟠',
    },
    {
      'key': 'hepsiburada',
      'name': 'Hepsiburada',
      'color': Color(0xFFE55A00),
      'bg': Color(0xFFFFF0E0),
      'url': 'https://www.hepsiburada.com/ara?q=',
      'emoji': '🟠',
    },
    {
      'key': 'n11',
      'name': 'N11',
      'color': Color(0xFF8B1A1A),
      'bg': Color(0xFFFFEBEE),
      'url': 'https://www.n11.com/arama/?q=',
      'emoji': '🔴',
    },
    {
      'key': 'amazon',
      'name': 'Amazon TR',
      'color': Color(0xFFB8860B),
      'bg': Color(0xFFFFF8E1),
      'url': 'https://www.amazon.com.tr/s?k=',
      'emoji': '📦',
    },
    {
      'key': 'vatan',
      'name': 'Vatan Bilgisayar',
      'color': Color(0xFF003DA5),
      'bg': Color(0xFFE8EEF9),
      'url': 'https://www.vatanbilgisayar.com/ara/?q=',
      'emoji': '🔵',
    },
    {
      'key': 'incehesap',
      'name': 'İncehesap',
      'color': Color(0xFF00A651),
      'bg': Color(0xFFE8F5E9),
      'url': 'https://www.incehesap.com/arama/?q=',
      'emoji': '🟢',
    },
    {
      'key': 'teknobiyotik',
      'name': 'Teknobiyotik',
      'color': Color(0xFF7B2D8B),
      'bg': Color(0xFFF3E5F5),
      'url': 'https://www.teknobiyotik.com/arama?q=',
      'emoji': '🟣',
    },
    {
      'key': 'teknosa',
      'name': 'Teknosa',
      'color': Color(0xFFC00010),
      'bg': Color(0xFFFFEBEE),
      'url': 'https://www.teknosa.com/arama?q=',
      'emoji': '🔴',
    },
    {
      'key': 'mediamarkt',
      'name': 'Media Markt',
      'color': Color(0xFFAA0000),
      'bg': Color(0xFFFFEBEE),
      'url': 'https://www.mediamarkt.com.tr/tr/search.html?query=',
      'emoji': '⭕',
    },
    {
      'key': 'boyner',
      'name': 'Boyner',
      'color': Color(0xFF333333),
      'bg': Color(0xFFF5F5F5),
      'url': 'https://www.boyner.com.tr/arama?q=',
      'emoji': '⚫',
    },
    {
      'key': 'beymen',
      'name': 'Beymen',
      'color': Color(0xFF111111),
      'bg': Color(0xFFF0F0F0),
      'url': 'https://www.beymen.com/search?q=',
      'emoji': '🖤',
    },
    {
      'key': 'pttavm',
      'name': 'PTT AVM',
      'color': Color(0xFFAA8800),
      'bg': Color(0xFFFFFDE7),
      'url': 'https://www.pttavm.com/arama?q=',
      'emoji': '🟡',
    },
  ];

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final encodedQuery = Uri.encodeComponent(query);

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: Text('"$query" Ara'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bilgi banner
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.primary.withOpacity(0.1),
                  AppTheme.primary.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppTheme.primary.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const Text('💡', style: TextStyle(fontSize: 20)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Canlı Fiyat Karşılaştırma',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${_sites.length} sitede "${query}" ürününü ara. Butona bas, direkt o sitenin arama sonuçlarına git!',
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Tüm sitelerde ara butonu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                for (final site in _sites) {
                  _openUrl('${site['url']}$encodedQuery');
                }
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF6B35), Color(0xFFFF8C55)],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primary.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('🚀', style: TextStyle(fontSize: 18)),
                    SizedBox(width: 8),
                    Text(
                      'Tüm Sitelerde Birden Ara',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Tek tek ara',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Site listesi
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _sites.length,
              itemBuilder: (context, index) {
                final site = _sites[index];
                final url = '${site['url']}$encodedQuery';
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppTheme.divider),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 4,
                    ),
                    leading: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: site['bg'] as Color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        site['emoji'] as String,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    title: Text(
                      site['name'] as String,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: site['color'] as Color,
                      ),
                    ),
                    subtitle: Text(
                      '"$query" için ara',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: site['color'] as Color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Ara →',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () => _openUrl(url),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
