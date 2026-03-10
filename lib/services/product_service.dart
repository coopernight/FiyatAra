import '../models/product.dart';

class ProductService {
  static final List<Product> _mockProducts = [
    // ── TELEFON ──────────────────────────────────────────────────────────────
    Product(
      id: '1',
      name: 'Apple iPhone 15 128GB',
      imageUrl: 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=400',
      category: 'Telefon',
      rating: 4.8,
      reviewCount: 12450,
      prices: [
        PriceEntry(siteName: 'Trendyol',     siteLogoUrl: 'trendyol',     price: 45999, originalPrice: 49999, inStock: true,  productUrl: 'https://trendyol.com',        shippingInfo: 'Ücretsiz kargo',   sellerName: 'Apple TR'),
        PriceEntry(siteName: 'Hepsiburada',  siteLogoUrl: 'hepsiburada',  price: 46750, originalPrice: 49999, inStock: true,  productUrl: 'https://hepsiburada.com',     shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'N11',          siteLogoUrl: 'n11',          price: 47200,                        inStock: true,  productUrl: 'https://n11.com',             shippingInfo: '1-3 iş günü'),
        PriceEntry(siteName: 'Amazon TR',    siteLogoUrl: 'amazon',       price: 46500, originalPrice: 49000, inStock: true,  productUrl: 'https://amazon.com.tr',       shippingInfo: 'Prime ücretsiz'),
        PriceEntry(siteName: 'Vatan',        siteLogoUrl: 'vatan',        price: 46999,                        inStock: true,  productUrl: 'https://vatanbilgisayar.com', shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'İncehesap',    siteLogoUrl: 'incehesap',    price: 45499, originalPrice: 48999, inStock: true,  productUrl: 'https://incehesap.com',       shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Teknosa',      siteLogoUrl: 'teknosa',      price: 47500,                        inStock: true,  productUrl: 'https://teknosa.com',         shippingInfo: '2 iş günü'),
        PriceEntry(siteName: 'Media Markt',  siteLogoUrl: 'mediamarkt',   price: 47999, originalPrice: 50999, inStock: true,  productUrl: 'https://mediamarkt.com.tr',   shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'PTT AVM',      siteLogoUrl: 'pttavm',       price: 46200,                        inStock: true,  productUrl: 'https://pttavm.com',          shippingInfo: 'PTT kargo'),
      ],
    ),

    Product(
      id: '2',
      name: 'Samsung Galaxy S24 256GB',
      imageUrl: 'https://images.unsplash.com/photo-1610945264803-c22b62d2a7b3?w=400',
      category: 'Telefon',
      rating: 4.6,
      reviewCount: 8920,
      prices: [
        PriceEntry(siteName: 'Trendyol',     siteLogoUrl: 'trendyol',     price: 38999,                        inStock: true,  productUrl: 'https://trendyol.com',        shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Hepsiburada',  siteLogoUrl: 'hepsiburada',  price: 37500, originalPrice: 41000, inStock: true,  productUrl: 'https://hepsiburada.com',     shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Amazon TR',    siteLogoUrl: 'amazon',       price: 39200,                        inStock: false, productUrl: 'https://amazon.com.tr',       shippingInfo: 'Stok yok'),
        PriceEntry(siteName: 'Vatan',        siteLogoUrl: 'vatan',        price: 38499, originalPrice: 42000, inStock: true,  productUrl: 'https://vatanbilgisayar.com', shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'İncehesap',    siteLogoUrl: 'incehesap',    price: 37999,                        inStock: true,  productUrl: 'https://incehesap.com',       shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Teknobiyotik', siteLogoUrl: 'teknobiyotik', price: 38200,                        inStock: true,  productUrl: 'https://teknobiyotik.com',    shippingInfo: '1-2 iş günü'),
        PriceEntry(siteName: 'Teknosa',      siteLogoUrl: 'teknosa',      price: 39500,                        inStock: true,  productUrl: 'https://teknosa.com',         shippingInfo: '2 iş günü'),
        PriceEntry(siteName: 'Media Markt',  siteLogoUrl: 'mediamarkt',   price: 38999, originalPrice: 43000, inStock: true,  productUrl: 'https://mediamarkt.com.tr',   shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'PTT AVM',      siteLogoUrl: 'pttavm',       price: 39000,                        inStock: true,  productUrl: 'https://pttavm.com',          shippingInfo: 'PTT kargo'),
      ],
    ),

    // ── ELEKTRONİK ───────────────────────────────────────────────────────────
    Product(
      id: '3',
      name: 'Sony WH-1000XM5 Kulaklık',
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
      category: 'Elektronik',
      rating: 4.9,
      reviewCount: 5640,
      prices: [
        PriceEntry(siteName: 'Trendyol',     siteLogoUrl: 'trendyol',     price: 8999,  originalPrice: 12000, inStock: true, productUrl: 'https://trendyol.com',        shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Hepsiburada',  siteLogoUrl: 'hepsiburada',  price: 9200,  originalPrice: 12000, inStock: true, productUrl: 'https://hepsiburada.com',     shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'N11',          siteLogoUrl: 'n11',          price: 8750,                         inStock: true, productUrl: 'https://n11.com',             shippingInfo: 'Bugün kargoda'),
        PriceEntry(siteName: 'Amazon TR',    siteLogoUrl: 'amazon',       price: 9100,                         inStock: true, productUrl: 'https://amazon.com.tr',       shippingInfo: 'Prime ücretsiz'),
        PriceEntry(siteName: 'Vatan',        siteLogoUrl: 'vatan',        price: 8899,  originalPrice: 11000, inStock: true, productUrl: 'https://vatanbilgisayar.com', shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'İncehesap',    siteLogoUrl: 'incehesap',    price: 8650,  originalPrice: 11500, inStock: true, productUrl: 'https://incehesap.com',       shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Teknobiyotik', siteLogoUrl: 'teknobiyotik', price: 8800,                         inStock: true, productUrl: 'https://teknobiyotik.com',    shippingInfo: '1-2 iş günü'),
        PriceEntry(siteName: 'Teknosa',      siteLogoUrl: 'teknosa',      price: 9300,  originalPrice: 12000, inStock: true, productUrl: 'https://teknosa.com',         shippingInfo: '2 iş günü'),
        PriceEntry(siteName: 'Media Markt',  siteLogoUrl: 'mediamarkt',   price: 9150,  originalPrice: 12500, inStock: true, productUrl: 'https://mediamarkt.com.tr',   shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'PTT AVM',      siteLogoUrl: 'pttavm',       price: 9000,                         inStock: true, productUrl: 'https://pttavm.com',          shippingInfo: 'PTT kargo'),
      ],
    ),

    // ── BİLGİSAYAR ───────────────────────────────────────────────────────────
    Product(
      id: '5',
      name: 'MacBook Air M2 8GB 256GB',
      imageUrl: 'https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?w=400',
      category: 'Bilgisayar',
      rating: 4.9,
      reviewCount: 7830,
      prices: [
        PriceEntry(siteName: 'Trendyol',     siteLogoUrl: 'trendyol',     price: 52999,                        inStock: true,  productUrl: 'https://trendyol.com',        shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Hepsiburada',  siteLogoUrl: 'hepsiburada',  price: 51500, originalPrice: 57000, inStock: true,  productUrl: 'https://hepsiburada.com',     shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'N11',          siteLogoUrl: 'n11',          price: 53200,                        inStock: false, productUrl: 'https://n11.com',             shippingInfo: 'Stok yok'),
        PriceEntry(siteName: 'Amazon TR',    siteLogoUrl: 'amazon',       price: 52000,                        inStock: true,  productUrl: 'https://amazon.com.tr',       shippingInfo: 'Prime ücretsiz'),
        PriceEntry(siteName: 'Vatan',        siteLogoUrl: 'vatan',        price: 51999, originalPrice: 56000, inStock: true,  productUrl: 'https://vatanbilgisayar.com', shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'İncehesap',    siteLogoUrl: 'incehesap',    price: 50999, originalPrice: 55999, inStock: true,  productUrl: 'https://incehesap.com',       shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Teknobiyotik', siteLogoUrl: 'teknobiyotik', price: 52500,                        inStock: true,  productUrl: 'https://teknobiyotik.com',    shippingInfo: '2 iş günü'),
        PriceEntry(siteName: 'Teknosa',      siteLogoUrl: 'teknosa',      price: 53999,                        inStock: true,  productUrl: 'https://teknosa.com',         shippingInfo: '2 iş günü'),
        PriceEntry(siteName: 'Media Markt',  siteLogoUrl: 'mediamarkt',   price: 53500, originalPrice: 58000, inStock: true,  productUrl: 'https://mediamarkt.com.tr',   shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'PTT AVM',      siteLogoUrl: 'pttavm',       price: 52800,                        inStock: true,  productUrl: 'https://pttavm.com',          shippingInfo: 'PTT kargo'),
      ],
    ),

    Product(
      id: '9',
      name: 'ASUS ROG Strix G16 RTX 4060',
      imageUrl: 'https://images.unsplash.com/photo-1593640495253-23196b27a87f?w=400',
      category: 'Bilgisayar',
      rating: 4.7,
      reviewCount: 3420,
      prices: [
        PriceEntry(siteName: 'Trendyol',     siteLogoUrl: 'trendyol',     price: 64999, originalPrice: 72000, inStock: true,  productUrl: 'https://trendyol.com',        shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Hepsiburada',  siteLogoUrl: 'hepsiburada',  price: 65500,                        inStock: true,  productUrl: 'https://hepsiburada.com',     shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Vatan',        siteLogoUrl: 'vatan',        price: 63999, originalPrice: 71000, inStock: true,  productUrl: 'https://vatanbilgisayar.com', shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'İncehesap',    siteLogoUrl: 'incehesap',    price: 63500, originalPrice: 70000, inStock: true,  productUrl: 'https://incehesap.com',       shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Teknobiyotik', siteLogoUrl: 'teknobiyotik', price: 64200,                        inStock: true,  productUrl: 'https://teknobiyotik.com',    shippingInfo: '2 iş günü'),
        PriceEntry(siteName: 'Teknosa',      siteLogoUrl: 'teknosa',      price: 66000,                        inStock: false, productUrl: 'https://teknosa.com',         shippingInfo: 'Stok yok'),
        PriceEntry(siteName: 'Media Markt',  siteLogoUrl: 'mediamarkt',   price: 65999, originalPrice: 73000, inStock: true,  productUrl: 'https://mediamarkt.com.tr',   shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'PTT AVM',      siteLogoUrl: 'pttavm',       price: 64700,                        inStock: true,  productUrl: 'https://pttavm.com',          shippingInfo: 'PTT kargo'),
      ],
    ),

    // ── EV ALETLERİ ───────────────────────────────────────────────────────────
    Product(
      id: '4',
      name: 'Dyson V15 Detect Süpürge',
      imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400',
      category: 'Ev Aletleri',
      rating: 4.7,
      reviewCount: 3210,
      prices: [
        PriceEntry(siteName: 'Trendyol',     siteLogoUrl: 'trendyol',     price: 22999, originalPrice: 27999, inStock: true,  productUrl: 'https://trendyol.com',      shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Hepsiburada',  siteLogoUrl: 'hepsiburada',  price: 23500,                        inStock: true,  productUrl: 'https://hepsiburada.com',   shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Amazon TR',    siteLogoUrl: 'amazon',       price: 22500, originalPrice: 25000, inStock: true,  productUrl: 'https://amazon.com.tr',     shippingInfo: 'Prime ücretsiz'),
        PriceEntry(siteName: 'N11',          siteLogoUrl: 'n11',          price: 23200,                        inStock: true,  productUrl: 'https://n11.com',           shippingInfo: '2 iş günü'),
        PriceEntry(siteName: 'Teknosa',      siteLogoUrl: 'teknosa',      price: 23999,                        inStock: true,  productUrl: 'https://teknosa.com',       shippingInfo: '2 iş günü'),
        PriceEntry(siteName: 'Media Markt',  siteLogoUrl: 'mediamarkt',   price: 23700, originalPrice: 28000, inStock: true,  productUrl: 'https://mediamarkt.com.tr', shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'PTT AVM',      siteLogoUrl: 'pttavm',       price: 22800,                        inStock: true,  productUrl: 'https://pttavm.com',        shippingInfo: 'PTT kargo'),
      ],
    ),

    Product(
      id: '6',
      name: 'Xiaomi Robot Süpürge S10+',
      imageUrl: 'https://images.unsplash.com/photo-1567690187548-f07b1d7bf5a9?w=400',
      category: 'Ev Aletleri',
      rating: 4.5,
      reviewCount: 2140,
      prices: [
        PriceEntry(siteName: 'Trendyol',     siteLogoUrl: 'trendyol',     price: 12999, originalPrice: 15999, inStock: true, productUrl: 'https://trendyol.com',        shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Hepsiburada',  siteLogoUrl: 'hepsiburada',  price: 13400,                        inStock: true, productUrl: 'https://hepsiburada.com',     shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'N11',          siteLogoUrl: 'n11',          price: 12800, originalPrice: 15000, inStock: true, productUrl: 'https://n11.com',             shippingInfo: '2 iş günü'),
        PriceEntry(siteName: 'Vatan',        siteLogoUrl: 'vatan',        price: 12999,                        inStock: true, productUrl: 'https://vatanbilgisayar.com', shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'İncehesap',    siteLogoUrl: 'incehesap',    price: 12500, originalPrice: 14999, inStock: true, productUrl: 'https://incehesap.com',       shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Teknobiyotik', siteLogoUrl: 'teknobiyotik', price: 12700,                        inStock: true, productUrl: 'https://teknobiyotik.com',    shippingInfo: '1-2 iş günü'),
        PriceEntry(siteName: 'Media Markt',  siteLogoUrl: 'mediamarkt',   price: 13200, originalPrice: 16000, inStock: true, productUrl: 'https://mediamarkt.com.tr',   shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'PTT AVM',      siteLogoUrl: 'pttavm',       price: 13000,                        inStock: true, productUrl: 'https://pttavm.com',          shippingInfo: 'PTT kargo'),
      ],
    ),

    // ── MUTFAK ────────────────────────────────────────────────────────────────
    Product(
      id: '8',
      name: 'Philips Airfryer XXL 7.3L',
      imageUrl: 'https://images.unsplash.com/photo-1585515320310-259814833e62?w=400',
      category: 'Mutfak',
      rating: 4.6,
      reviewCount: 4560,
      prices: [
        PriceEntry(siteName: 'Trendyol',     siteLogoUrl: 'trendyol',     price: 5999,  originalPrice: 7500, inStock: true, productUrl: 'https://trendyol.com',      shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Hepsiburada',  siteLogoUrl: 'hepsiburada',  price: 6200,                       inStock: true, productUrl: 'https://hepsiburada.com',   shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Amazon TR',    siteLogoUrl: 'amazon',       price: 5850,  originalPrice: 7000, inStock: true, productUrl: 'https://amazon.com.tr',     shippingInfo: 'Prime ücretsiz'),
        PriceEntry(siteName: 'N11',          siteLogoUrl: 'n11',          price: 6100,                       inStock: true, productUrl: 'https://n11.com',           shippingInfo: '2 iş günü'),
        PriceEntry(siteName: 'Media Markt',  siteLogoUrl: 'mediamarkt',   price: 6300,  originalPrice: 7800, inStock: true, productUrl: 'https://mediamarkt.com.tr', shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'PTT AVM',      siteLogoUrl: 'pttavm',       price: 5999,                       inStock: true, productUrl: 'https://pttavm.com',        shippingInfo: 'PTT kargo'),
        PriceEntry(siteName: 'Teknosa',      siteLogoUrl: 'teknosa',      price: 6400,  originalPrice: 7999, inStock: true, productUrl: 'https://teknosa.com',       shippingInfo: '2 iş günü'),
      ],
    ),

    // ── SPOR ─────────────────────────────────────────────────────────────────
    Product(
      id: '7',
      name: 'Nike Air Max 270 Spor Ayakkabı',
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
      category: 'Spor',
      rating: 4.4,
      reviewCount: 9870,
      prices: [
        PriceEntry(siteName: 'Trendyol',     siteLogoUrl: 'trendyol',     price: 3299,  originalPrice: 4500, inStock: true, productUrl: 'https://trendyol.com',    shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Hepsiburada',  siteLogoUrl: 'hepsiburada',  price: 3450,                       inStock: true, productUrl: 'https://hepsiburada.com', shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'N11',          siteLogoUrl: 'n11',          price: 3199,  originalPrice: 4200, inStock: true, productUrl: 'https://n11.com',         shippingInfo: 'Bugün kargoda'),
        PriceEntry(siteName: 'Boyner',       siteLogoUrl: 'boyner',       price: 3350,  originalPrice: 4500, inStock: true, productUrl: 'https://boyner.com.tr',   shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'PTT AVM',      siteLogoUrl: 'pttavm',       price: 3299,                       inStock: true, productUrl: 'https://pttavm.com',      shippingInfo: 'PTT kargo'),
      ],
    ),

    // ── GİYİM & MODA ─────────────────────────────────────────────────────────
    Product(
      id: '10',
      name: 'Tommy Hilfiger Erkek Polo Tişört',
      imageUrl: 'https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=400',
      category: 'Giyim',
      rating: 4.3,
      reviewCount: 6540,
      prices: [
        PriceEntry(siteName: 'Trendyol',     siteLogoUrl: 'trendyol',     price: 899,   originalPrice: 1299, inStock: true, productUrl: 'https://trendyol.com',    shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Hepsiburada',  siteLogoUrl: 'hepsiburada',  price: 950,   originalPrice: 1350, inStock: true, productUrl: 'https://hepsiburada.com', shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Boyner',       siteLogoUrl: 'boyner',       price: 879,   originalPrice: 1299, inStock: true, productUrl: 'https://boyner.com.tr',   shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Beymen',       siteLogoUrl: 'beymen',       price: 1250,                       inStock: true, productUrl: 'https://beymen.com',      shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'N11',          siteLogoUrl: 'n11',          price: 920,                        inStock: true, productUrl: 'https://n11.com',         shippingInfo: '2 iş günü'),
        PriceEntry(siteName: 'PTT AVM',      siteLogoUrl: 'pttavm',       price: 899,                        inStock: true, productUrl: 'https://pttavm.com',      shippingInfo: 'PTT kargo'),
      ],
    ),

    Product(
      id: '11',
      name: 'Mavi Kadın Slim Jean 900 Dark',
      imageUrl: 'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=400',
      category: 'Giyim',
      rating: 4.5,
      reviewCount: 11200,
      prices: [
        PriceEntry(siteName: 'Trendyol',     siteLogoUrl: 'trendyol',     price: 799,   originalPrice: 1099, inStock: true, productUrl: 'https://trendyol.com',    shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Hepsiburada',  siteLogoUrl: 'hepsiburada',  price: 849,                        inStock: true, productUrl: 'https://hepsiburada.com', shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Boyner',       siteLogoUrl: 'boyner',       price: 779,   originalPrice: 1099, inStock: true, productUrl: 'https://boyner.com.tr',   shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'N11',          siteLogoUrl: 'n11',          price: 820,                        inStock: true, productUrl: 'https://n11.com',         shippingInfo: '2 iş günü'),
        PriceEntry(siteName: 'PTT AVM',      siteLogoUrl: 'pttavm',       price: 810,                        inStock: true, productUrl: 'https://pttavm.com',      shippingInfo: 'PTT kargo'),
      ],
    ),

    Product(
      id: '12',
      name: 'Beymen Club Deri Kemer',
      imageUrl: 'https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?w=400',
      category: 'Aksesuar',
      rating: 4.7,
      reviewCount: 890,
      prices: [
        PriceEntry(siteName: 'Beymen',       siteLogoUrl: 'beymen',       price: 1499,                        inStock: true, productUrl: 'https://beymen.com',      shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Trendyol',     siteLogoUrl: 'trendyol',     price: 1350,  originalPrice: 1699, inStock: true, productUrl: 'https://trendyol.com',    shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Boyner',       siteLogoUrl: 'boyner',       price: 1399,  originalPrice: 1699, inStock: true, productUrl: 'https://boyner.com.tr',   shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Hepsiburada',  siteLogoUrl: 'hepsiburada',  price: 1420,                        inStock: true, productUrl: 'https://hepsiburada.com', shippingInfo: 'Ücretsiz kargo'),
      ],
    ),

    // ── OYUN ─────────────────────────────────────────────────────────────────
    Product(
      id: '13',
      name: 'Sony PlayStation 5 Slim Disk',
      imageUrl: 'https://images.unsplash.com/photo-1606813907291-d86efa9b94db?w=400',
      category: 'Oyun',
      rating: 4.9,
      reviewCount: 15670,
      prices: [
        PriceEntry(siteName: 'Trendyol',     siteLogoUrl: 'trendyol',     price: 24999,                        inStock: true,  productUrl: 'https://trendyol.com',        shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Hepsiburada',  siteLogoUrl: 'hepsiburada',  price: 25200,                        inStock: true,  productUrl: 'https://hepsiburada.com',     shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Vatan',        siteLogoUrl: 'vatan',        price: 24799, originalPrice: 27000, inStock: true,  productUrl: 'https://vatanbilgisayar.com', shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'İncehesap',    siteLogoUrl: 'incehesap',    price: 24500, originalPrice: 26500, inStock: true,  productUrl: 'https://incehesap.com',       shippingInfo: 'Ücretsiz kargo'),
        PriceEntry(siteName: 'Teknobiyotik', siteLogoUrl: 'teknobiyotik', price: 24700,                        inStock: true,  productUrl: 'https://teknobiyotik.com',    shippingInfo: '1-2 iş günü'),
        PriceEntry(siteName: 'Teknosa',      siteLogoUrl: 'teknosa',      price: 25500,                        inStock: true,  productUrl: 'https://teknosa.com',         shippingInfo: '2 iş günü'),
        PriceEntry(siteName: 'Media Markt',  siteLogoUrl: 'mediamarkt',   price: 25999, originalPrice: 27999, inStock: false, productUrl: 'https://mediamarkt.com.tr',   shippingInfo: 'Stok yok'),
        PriceEntry(siteName: 'Amazon TR',    siteLogoUrl: 'amazon',       price: 24900,                        inStock: true,  productUrl: 'https://amazon.com.tr',       shippingInfo: 'Prime ücretsiz'),
        PriceEntry(siteName: 'PTT AVM',      siteLogoUrl: 'pttavm',       price: 25100,                        inStock: true,  productUrl: 'https://pttavm.com',          shippingInfo: 'PTT kargo'),
      ],
    ),
  ];

  static List<String> get categories {
    final cats = _mockProducts.map((p) => p.category).toSet().toList();
    cats.sort();
    return ['Tümü', ...cats];
  }

  static Future<List<Product>> searchProducts(String query, {String? category}) async {
    await Future.delayed(const Duration(milliseconds: 700));
    return _mockProducts.where((p) {
      final matchesQuery = query.isEmpty ||
          p.name.toLowerCase().contains(query.toLowerCase()) ||
          p.category.toLowerCase().contains(query.toLowerCase());
      final matchesCategory =
          category == null || category == 'Tümü' || p.category == category;
      return matchesQuery && matchesCategory;
    }).toList();
  }

  static Future<List<Product>> getPopularProducts() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockProducts;
  }
}
