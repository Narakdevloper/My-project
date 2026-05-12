import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:narak_news/contant/app_theme.dart';
import 'package:narak_news/models/product_model.dart';
import 'package:narak_news/providers/api_provider.dart';
import 'package:narak_news/providers/theme_provider.dart';
import 'package:narak_news/ui/screens/detail_screen.dart';
import 'package:narak_news/ui/widgets/movie_list.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;
  List<Movie> _results = [];
  bool _isLoading = false;
  bool _hasSearched = false;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> _search(String query) async {
    if (query.trim().isEmpty) {
      setState(() {
        _results = [];
        _hasSearched = false;
      });
      return;
    }
    setState(() {
      _isLoading = true;
      _hasSearched = true;
      _results = [];
    });
    try {
      final movies = await Serchproduct().serchproduct(query);
      setState(() {
        _results = movies;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  void _onChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () => _search(value));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().theme;

    return Scaffold(
      backgroundColor: AppTheme.bg(isDark),
      appBar: AppBar(
        backgroundColor: AppTheme.bg(isDark),
        automaticallyImplyLeading: false,
        title: TextField(
          controller: _controller,
          focusNode: _focusNode,
          autofocus: false,
          style: TextStyle(color: AppTheme.text(isDark)),
          cursorColor: AppTheme.primary,
          decoration: InputDecoration(
            hintText: 'Search movies...',
            hintStyle: TextStyle(color: AppTheme.hint(isDark)),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: AppTheme.hint(isDark)),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear, color: AppTheme.hint(isDark)),
                    onPressed: () {
                      _controller.clear();
                      setState(() {
                        _results = [];
                        _hasSearched = false;
                      });
                    },
                  )
                : null,
          ),
          onChanged: _onChanged,
        ),
      ),
      body: _buildBody(isDark),
    );
  }

  Widget _buildBody(bool isDark) {
    if (!_hasSearched) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.movie_filter,
              color: AppTheme.icon(isDark),
              size: 80,
            ).animate().fadeIn(duration: 600.ms).scaleXY(begin: 0.8, end: 1),
            SizedBox(height: 16),
            Text(
              'Search for movies',
              style: TextStyle(color: AppTheme.sub(isDark), fontSize: 16),
            ).animate().fadeIn(delay: 200.ms),
          ],
        ),
      );
    }

    if (_isLoading) {
      return Center(child: CircularProgressIndicator(color: AppTheme.primary));
    }

    if (_results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              color: AppTheme.icon(isDark),
              size: 80,
            ).animate().fadeIn(duration: 400.ms),
            SizedBox(height: 16),
            Text(
              'No results found',
              style: TextStyle(color: AppTheme.sub(isDark), fontSize: 16),
            ).animate().fadeIn(delay: 200.ms),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: _results.length,
      itemBuilder: (context, index) => MovieListItem(
        movie: _results[index],
        isDark: isDark,
        index: index,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => DetailScreen(_results[index])),
        ),
      ),
    );
  }
}
