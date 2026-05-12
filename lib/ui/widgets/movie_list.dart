import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:narak_news/contant/app_theme.dart';
import 'package:narak_news/models/product_model.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;
  final bool isDark;
  final int index;

  const MovieListItem({
    required this.movie,
    required this.onTap,
    required this.isDark,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: AppTheme.card(isDark),
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                Hero(
                  tag: 'poster_${movie.id}_search',
                  child: Image.network(
                    movie.posterUrl,
                    width: 90,
                    height: 130,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 90,
                      height: 130,
                      color: AppTheme.bg(isDark),
                      child: Icon(Icons.movie, color: AppTheme.icon(isDark)),
                    ),
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) return child;
                      return Container(
                        width: 90,
                        height: 130,
                        color: AppTheme.bg(isDark),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppTheme.text(isDark),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.star, color: AppTheme.primary, size: 13),
                            SizedBox(width: 4),
                            Text(
                              movie.voteAverage.toStringAsFixed(1),
                              style: TextStyle(
                                color: AppTheme.sub(isDark),
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 12),
                            Icon(
                              Icons.calendar_today,
                              color: AppTheme.hint(isDark),
                              size: 12,
                            ),
                            SizedBox(width: 4),
                            Text(
                              movie.releaseDate.isNotEmpty
                                  ? movie.releaseDate.substring(0, 4)
                                  : 'N/A',
                              style: TextStyle(
                                color: AppTheme.sub(isDark),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          movie.overview,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppTheme.sub(isDark),
                            fontSize: 12,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        .animate(delay: Duration(milliseconds: index * 60))
        .fadeIn(duration: 300.ms)
        .slideX(begin: 0.2, end: 0);
  }
}
