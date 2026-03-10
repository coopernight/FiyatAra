import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../models/product.dart';
import '../services/product_service.dart';
import '../theme/app_theme.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'Tümü';
  List<Product> _products = [];
  bool _isLoading = false;
  bool _hasSearched = false;
  String _sortBy = 'Fiyat (Artan)';

  final List<String> _sortOptions = [
    'Fiyat (Artan)',
    'Fiyat (Azalan)',
    'Puan',
    'Değerlendirme',
  ];

  @override
  void initState() {
    super.initState();
    _loadPopular();
  }

  Future<void> _loadPopular() async {
    setState(() => _isLoading = true);
    final products = await ProductService.getPopularProducts();
    setState(() {
      _products = products;
      _isLoading = false;
    });
  }

  Future<void> _search(String query) async {
    setState(() {
      _isLoading = true;
      _hasSearched = query.isNotEmpty;
    });
    final results = await ProductService.searchProducts(
      query,
      category: _selectedCategory,
    );
    setState(() {
      _products = _applySorting(results);
      _isLoading = false;
    });
  }

  List<Product> _applySorting(List<Product> products) {
    switch (_sortBy) {
      case 'Fiyat (Artan)':
        return [...products]..sort((a, b) => a.lowestPrice.compareTo(b.lowestPrice));
      case 'Fiyat (Azalan)':
        return [...products]..sort((a, b) => b.lowestPrice.compareTo(a.lowestPrice));
      case 'Puan':
        return [...products]..sort((a, b) => b.rating.compareTo(a.rating));
      case 'Değerlendirme':
        return [...products]..sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
      default:
        return products;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            expandedHeight: 140,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFFF6B35), Color(0xFFFF8C55)],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '🇹🇷 FiyatBul',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'En iyi fiyatı bul, tasarruf et!',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                            // Site logoları
                            Row(
                              children: [
                                _siteChip('T'),
                                _siteChip('H'),
                                _siteChip('N'),
                                _siteChip('A'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: TextField(
                  controller: _searchController,
                  onChanged: _search,
                  decoration: InputDecoration(
                    hintText: 'iPhone, Samsung, Dyson...',
                    prefixIcon: const Icon(Icons.search_rounded, color: AppTheme.primary),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear_rounded, color: AppTheme.textSecondary),
                            onPressed: () {
                              _searchController.clear();
                              _loadPopular();
                            },
                          )
                        : null,
                  ),
                ),
              ),
            ),
          ),

          // Kategoriler
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              height: 44,
              margin: const EdgeInsets.only(bottom: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: ProductService.categories.length,
                itemBuilder: (context, index) {
                  final cat = ProductService.categories[index];
                  final isSelected = cat == _selectedCategory;
                  return GestureDetector(
                    onTap: () {
                      setState(() => _selectedCategory = cat);
                      _search(_searchController.text);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8, top: 6, bottom: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected ? AppTheme.primary : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? AppTheme.primary : AppTheme.divider,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        cat,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                          color: isSelected ? Colors.white : AppTheme.textPrimary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Sıralama ve sonuç sayısı
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _hasSearched
                        ? '${_products.length} sonuç'
                        : 'Popüler Ürünler',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  // Sıralama dropdown
                  GestureDetector(
                    onTap: _showSortBottomSheet,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppTheme.divider),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.sort_rounded, size: 16, color: AppTheme.textSecondary),
                          const SizedBox(width: 4),
                          Text(
                            _sortBy,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.textPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Ürün listesi
          if (_isLoading)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _buildShimmerCard(),
                  childCount: 4,
                ),
              ),
            )
          else if (_products.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_off_rounded, size: 64, color: Colors.grey[400]),
                    const SizedBox(height: 16),
                    const Text(
                      'Ürün bulunamadı',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Farklı bir arama deneyin',
                      style: TextStyle(fontSize: 13, color: AppTheme.textSecondary),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ProductCard(
                    product: _products[index],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(product: _products[index]),
                      ),
                    ),
                  ),
                  childCount: _products.length,
                ),
              ),
            ),
          
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }

  Widget _siteChip(String letter) {
    return Container(
      width: 28,
      height: 28,
      margin: const EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white30),
      ),
      alignment: Alignment.center,
      child: Text(
        letter,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildShimmerCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sırala',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            ..._sortOptions.map((option) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Radio<String>(
                    value: option,
                    groupValue: _sortBy,
                    activeColor: AppTheme.primary,
                    onChanged: (value) {
                      setState(() {
                        _sortBy = value!;
                        _products = _applySorting(_products);
                      });
                      Navigator.pop(context);
                    },
                  ),
                  title: Text(option),
                  onTap: () {
                    setState(() {
                      _sortBy = option;
                      _products = _applySorting(_products);
                    });
                    Navigator.pop(context);
                  },
                )),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
