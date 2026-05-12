import 'package:flutter/material.dart';
import 'package:narak_news/models/product_model.dart';
import 'package:narak_news/providers/theme_provider.dart';
import 'package:narak_news/ui/widgets/animated_body.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;
  const DetailScreen(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().theme;
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    final textColor = isDark ? Colors.white : Colors.black87;
    final subColor = isDark ? Colors.white54 : Colors.black54;
    final cardColor = Theme.of(context).cardColor;

    return Scaffold(
      backgroundColor: bgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            backgroundColor: bgColor,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'backdrop_${movie.id}',
                    child: Image.network(
                      movie.backdropUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: cardColor,
                        child: Icon(
                          Icons.movie,
                          color: Colors.white24,
                          size: 60,
                        ),
                      ),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, bgColor],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 16,
                    right: 16,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Hero(
                          tag: 'poster_${movie.id}',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              movie.posterUrl,
                              width: 90,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.white54,
                                    size: 12,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    movie.releaseDate.isNotEmpty
                                        ? movie.releaseDate.substring(0, 4)
                                        : 'N/A',
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFE50914),
                                    size: 12,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    movie.voteAverage.toStringAsFixed(1),
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: AnimatedBody(
              movie: movie,
              textColor: textColor,
              subColor: subColor,
              cardColor: cardColor,
            ),
          ),
        ],
      ),
    );
  }
}
