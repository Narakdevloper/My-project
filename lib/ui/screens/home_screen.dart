import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart' hide ShimmerEffect;
import 'package:narak_news/contant/app_theme.dart';
import 'package:narak_news/models/product_model.dart';
import 'package:narak_news/providers/api_provider.dart';
import 'package:narak_news/providers/theme_provider.dart';
import 'package:narak_news/ui/screens/detail_screen.dart';
import 'package:narak_news/ui/widgets/movies_card.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Movie> _movies = [];
  final ScrollController _scrollController = ScrollController();
  int _page = 1;
  bool _isLoading = false;
  bool _isFirstLoad = true;
  bool _hasMore = true;
  bool showupicon = false;
  @override
  void initState() {
    super.initState();
    _loadMovies();
    _scrollController.addListener(_onScroll);
    _scrollController.addListener(() {
      setState(() {
        showupicon = _scrollController.position.pixels >= 500;
      });
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      _loadMovies();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMovies() async {
    if (_isLoading || !_hasMore) return;
    setState(() => _isLoading = true);
    try {
      final newMovies = await Service().readapi(page: _page);
      setState(() {
        _movies.addAll(newMovies);
        _page++;
        _isLoading = false;
        _isFirstLoad = false;
        if (newMovies.isEmpty) _hasMore = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _isFirstLoad = false;
      });
    }
  }

  Future<void> _onRefresh() async {
    _scrollController.removeListener(_onScroll);

    setState(() {
      _movies.clear();
      _page = 1;
      _hasMore = true;
      _isFirstLoad = true;
      _isLoading = false;
    });

    await _loadMovies();

    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().theme;

    return Scaffold(
      backgroundColor: AppTheme.bg(isDark),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: AppTheme.primary,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: 120,
              pinned: true,
              backgroundColor: AppTheme.bg(isDark),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 20, bottom: 16),
                title:
                    Text(
                          'CINEMAX',
                          style: TextStyle(
                            color: AppTheme.text(isDark),
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 6,
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
                  child: Text(
                    'POPULAR NOW',
                    style: TextStyle(
                      color: AppTheme.sub(isDark),
                      fontSize: 13,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w600,
                    ),
                  ).animate().fadeIn(delay: 200.ms),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              sliver: _isFirstLoad
                  ? SliverToBoxAdapter(
                      child: Skeletonizer(
                        enabled: true,
                        effect: ShimmerEffect(
                          baseColor: AppTheme.shimmerBase(isDark),
                          highlightColor: AppTheme.shimmerHigh(isDark),
                        ),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.62,
                              ),
                          itemCount: 10,
                          itemBuilder: (_, __) => Container(
                            decoration: BoxDecoration(
                              color: AppTheme.card(isDark),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    )
                  : SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => MovieCard(
                          movie: _movies[index],
                          isDark: isDark,
                          index: index,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailScreen(_movies[index]),
                            ),
                          ),
                        ),
                        childCount: _movies.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.62,
                      ),
                    ),
            ),
            if (_isLoading && !_isFirstLoad)
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: CircularProgressIndicator(color: AppTheme.primary),
                  ),
                ),
              ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
      floatingActionButton: showupicon
          ? Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: const Color(0xFFE50914), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE50914).withAlpha(80),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Material(
                color: const Color(0xFFE50914).withAlpha(30),
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    );
                  },
                  child: const Center(
                    child: Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: Color(0xFFE50914),
                      size: 26,
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
