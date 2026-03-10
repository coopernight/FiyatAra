import 'package:flutter/material.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';

class SiteBadge extends StatelessWidget {
  final PriceEntry entry;
  final bool isLowest;

  const SiteBadge({
    super.key,
    required this.entry,
    this.isLowest = false,
  });

  @override
  Widget build(BuildContext context) {
    final siteInfo = SiteInfo.sites[entry.siteLogoUrl];
    final color = siteInfo?['color'] as Color? ?? AppTheme.textSecondary;
    final bgColor = siteInfo?['bgColor'] as Color? ?? Colors.grey[100]!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: isLowest ? AppTheme.accent.withOpacity(0.1) : bgColor,
        borderRadius: BorderRadius.circular(6),
        border: isLowest
            ? Border.all(color: AppTheme.accent, width: 1)
            : Border.all(color: color.withOpacity(0.3), width: 0.5),
      ),
      child: Text(
        entry.siteName,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w600,
          color: isLowest ? AppTheme.accent : color,
        ),
      ),
    );
  }
}
