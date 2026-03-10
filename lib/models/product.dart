class Product {
  final String id;
  final String name;
  final String imageUrl;
  final String category;
  final double rating;
  final int reviewCount;
  final List<PriceEntry> prices;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.prices,
  });

  double get lowestPrice =>
      prices.map((p) => p.price).reduce((a, b) => a < b ? a : b);

  double get highestPrice =>
      prices.map((p) => p.price).reduce((a, b) => a > b ? a : b);

  PriceEntry get cheapestEntry =>
      prices.reduce((a, b) => a.price < b.price ? a : b);
}

class PriceEntry {
  final String siteName;
  final String siteLogoUrl;
  final double price;
  final double? originalPrice;
  final bool inStock;
  final String productUrl;
  final String? shippingInfo;
  final String? sellerName;

  PriceEntry({
    required this.siteName,
    required this.siteLogoUrl,
    required this.price,
    this.originalPrice,
    required this.inStock,
    required this.productUrl,
    this.shippingInfo,
    this.sellerName,
  });

  double? get discountPercent {
    if (originalPrice != null && originalPrice! > price) {
      return ((originalPrice! - price) / originalPrice! * 100).roundToDouble();
    }
    return null;
  }
}
