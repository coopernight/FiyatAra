# 🇹🇷 FiyatBul - Türkiye Fiyat Karşılaştırma Uygulaması

Flutter ile geliştirilmiş, Türkiye'deki e-ticaret sitelerindeki fiyatları karşılaştıran mobil uygulama.

## 📱 Desteklenen Siteler
- **Trendyol**
- **Hepsiburada**
- **N11**
- **Amazon Türkiye**

## 🚀 Özellikler

- 🔍 **Ürün Arama** - İsim veya kategoriye göre arama
- 💰 **Fiyat Karşılaştırma** - Tüm sitelerdeki fiyatları yan yana görüntüleme
- 📊 **Sıralama** - Fiyat, puan veya değerlendirme sayısına göre sıralama
- 🏷️ **Kategori Filtreleme** - Elektronik, Ev Aletleri, Giyim vb.
- ⭐ **Favoriler** - Beğenilen ürünleri kaydetme
- 🔔 **Fiyat Alarmları** - İstenen fiyata düşünce bildirim *(yakında)*
- 📦 **Kargo Bilgisi** - Her site için kargo detayları
- 🛒 **Doğrudan Yönlendirme** - Siteye tek tıkla git

## 🛠️ Kurulum

### Gereksinimler
- Flutter SDK 3.0+
- Dart SDK 3.0+
- Android Studio veya VS Code

### Adımlar

```bash
# Repoyu klonla
git clone <repo-url>
cd fiyat_karsilastirma

# Bağımlılıkları yükle
flutter pub get

# iOS için pod yükle
cd ios && pod install && cd ..

# Uygulamayı başlat
flutter run
```

## 📁 Proje Yapısı

```
lib/
├── main.dart                   # Uygulama girişi & navigasyon
├── models/
│   └── product.dart            # Ürün & fiyat modelleri
├── screens/
│   ├── home_screen.dart        # Ana arama ekranı
│   └── product_detail_screen.dart  # Fiyat karşılaştırma detay
├── services/
│   └── product_service.dart    # Veri servisi (API/mock)
├── theme/
│   └── app_theme.dart          # Renkler, tema ayarları
└── widgets/
    ├── product_card.dart       # Ürün kartı bileşeni
    └── site_badge.dart         # Site rozeti bileşeni
```

## 🔌 Gerçek API Entegrasyonu

Şu anda uygulama demo verileri kullanmaktadır. Gerçek fiyat verisi için:

### Seçenek 1: Web Scraping API
```dart
// product_service.dart içinde:
final response = await http.get(
  Uri.parse('https://your-scraping-api.com/search?q=$query'),
);
final data = jsonDecode(response.body);
```

### Seçenek 2: Önerilen Üçüncü Parti API'ler
- **Prisync** - Fiyat izleme API'si
- **PriceAPI** - Türk e-ticaret fiyat verisi
- **RapidAPI** - Çeşitli e-ticaret scraper'ları

### Backend Geliştirme
Python/Node.js ile `Scrapy` veya `Playwright` kullanarak:
- Trendyol, Hepsiburada, N11, Amazon.com.tr scraper
- Redis cache ile hızlı yanıt süresi
- REST API endpoint

## 🎨 Tasarım

- **Ana renk:** Turuncu (#FF6B35) - Türk e-ticaret estetiği
- **Vurgu:** Yeşil (#00B894) - En ucuz fiyat gösterimi
- Material Design 3 bileşenleri
- iOS ve Android uyumlu

## 📋 Geliştirme Yol Haritası

- [ ] Gerçek API entegrasyonu
- [ ] Fiyat geçmişi grafiği
- [ ] Fiyat alarmları (push notification)
- [ ] Barkod tarama ile ürün arama
- [ ] Kullanıcı girişi & profil
- [ ] Favori listesi senkronizasyonu
- [ ] Widget (Ana ekran fiyat takibi)
