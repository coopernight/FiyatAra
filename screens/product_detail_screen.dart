import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final sortedPrices = [...product.prices]..sort((a, b) => a.price.compareTo(b.price));

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Fiyat Karşılaştırma'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ürün görseli
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              child: CachedNetworkImage(
                imageUrl: product.imageUrl,
                height: 220,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 12),
            // Ürün bilgileri
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      product.category,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ...List.generate(5, (i) => Icon(
                        i < product.rating.floor()
                            ? Icons.star_rounded
                            : i < product.rating
                                ? Icons.star_half_rounded
                                : Icons.star_outline_rounded,
                        color: const Color(0xFFFFB800),
                        size: 18,
                      )),
                      const SizedBox(width: 8),
                      Text(
                        '${product.rating} • ${_formatCount(product.reviewCount)} değerlendirme',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Fiyat aralığı
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.accent.withOpacity(0.1),
                          AppTheme.accent.withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppTheme.accent.withOpacity(0.3)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _priceRangeItem(
                          'En Düşük',
                          _formatPrice(product.lowestPrice),
                          AppTheme.accent,
                        ),
                        Container(width: 1, height: 40, color: AppTheme.accent.withOpacity(0.3)),
                        _priceRangeItem(
                          'En Yüksek',
                          _formatPrice(product.highestPrice),
                          AppTheme.error,
                        ),
                        Container(width: 1, height: 40, color: AppTheme.accent.withOpacity(0.3)),
                        _priceRangeItem(
                          'Tasarruf',
                          _formatPrice(product.highestPrice - product.lowestPrice),
                          const Color(0xFF6C5CE7),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Fiyat karşılaştırma listesi
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tüm Fiyatlar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${product.prices.length} site karşılaştırıldı',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...sortedPrices.asMap().entries.map((entry) =>
                      _buildPriceRow(context, entry.value, entry.key == 0)),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      // En ucuz fiyattan satın al butonu
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: AppTheme.divider)),
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () => _openUrl(product.cheapestEntry.productUrl),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.accent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shopping_cart_rounded, size: 20),
                const SizedBox(width: 8),
                Text(
                  '${product.cheapestEntry.siteName}\'de ${_formatPrice(product.lowestPrice)} Al',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _priceRangeItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: AppTheme.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(BuildContext context, PriceEntry entry, bool isCheapest) {
    final siteInfo = SiteInfo.sites[entry.siteLogoUrl];
    final color = siteInfo?['color'] as Color? ?? AppTheme.textSecondary;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isCheapest
            ? AppTheme.accent.withOpacity(0.05)
            : Colors.grey[50],
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isCheapest ? AppTheme.accent.withOpacity(0.4) : AppTheme.divider,
          width: isCheapest ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          // Site adı kutusu
          Container(
            width: 80,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              entry.siteName,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      _formatPrice(entry.price),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: isCheapest ? AppTheme.accent : AppTheme.textPrimary,
                      ),
                    ),
                    if (entry.originalPrice != null) ...[
                      const SizedBox(width: 8),
                      Text(
                        _formatPrice(entry.originalPrice!),
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                    if (isCheapest) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppTheme.accent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'EN UCUZ',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                if (entry.shippingInfo != null)
                  Text(
                    entry.shippingInfo!,
                    style: TextStyle(
                      fontSize: 11,
                      color: entry.shippingInfo!.contains('Ücretsiz') || entry.shippingInfo!.contains('Prime')
                          ? AppTheme.accent
                          : AppTheme.textSecondary,
                    ),
                  ),
              ],
            ),
          ),
          // Satın al butonu
          if (entry.inStock)
            GestureDetector(
              onTap: () => _openUrl(entry.productUrl),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Git',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Stok Yok',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  String _formatPrice(double price) {
    if (price >= 1000) {
      final formatted = price.toStringAsFixed(0);
      final parts = <String>[];
      var i = formatted.length;
      while (i > 0) {
        final start = (i - 3).clamp(0, i);
        parts.insert(0, formatted.substring(start, i));
        i = start;
      }
      return '${parts.join('.')} ₺';
    }
    return '${price.toStringAsFixed(0)} ₺';
  }

  String _formatCount(int count) {
    if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}B';
    }
    return count.toString();
  }
}
