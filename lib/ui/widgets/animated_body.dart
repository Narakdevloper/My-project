import 'package:flutter/material.dart';
import 'package:narak_news/models/product_model.dart';
import 'package:narak_news/ui/widgets/stat_chip.dart';

class AnimatedBody extends StatefulWidget {
  final Movie movie;
  final Color textColor;
  final Color subColor;
  final Color cardColor;

  const AnimatedBody({
    super.key,
    required this.movie,
    required this.textColor,
    required this.subColor,
    required this.cardColor,
  });

  @override
  State<AnimatedBody> createState() => _AnimatedBodyState();
}

class _AnimatedBodyState extends State<AnimatedBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  StatChip(
                    icon: Icons.thumb_up_alt_outlined,
                    label: '${widget.movie.voteCount} votes',
                    cardColor: widget.cardColor,
                    subColor: widget.subColor,
                  ),
                  SizedBox(width: 10),
                  StatChip(
                    icon: Icons.trending_up,
                    label: widget.movie.popularity.toStringAsFixed(0),
                    cardColor: widget.cardColor,
                    subColor: widget.subColor,
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'SYNOPSIS',
                style: TextStyle(
                  color: const Color(0xFFE50914),
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 4,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.movie.overview.isNotEmpty
                    ? widget.movie.overview
                    : 'No description available.',
                style: TextStyle(
                  color: widget.subColor,
                  fontSize: 14,
                  height: 1.7,
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
