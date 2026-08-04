import 'package:flutter/material.dart';

class AnimatedLikeButton extends StatefulWidget {
  final bool isLiked;
  final VoidCallback? onTap;

  const AnimatedLikeButton({
    super.key,
    required this.isLiked,
    this.onTap,
  });

  @override
  State<AnimatedLikeButton> createState() => _AnimatedLikeButtonState();
}

class _AnimatedLikeButtonState extends State<AnimatedLikeButton> {
  double scale = 1.0;

  void _toggleLike() {
    setState(() {
      scale = 1.35;
    });

    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        setState(() {
          scale = 1.0;
        });
      }
    });

    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 150),
          child: IconButton(
            icon: Icon(
              widget.isLiked ? Icons.favorite : Icons.favorite_border,
              color: widget.isLiked ? Colors.red : Colors.white,
              size: 26,
            ),
            onPressed: _toggleLike,
          ),
        ),
        Text(
          '${widget.isLiked ? 1 : 0}',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}