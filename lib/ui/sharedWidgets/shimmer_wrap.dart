import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWrap extends StatelessWidget {
  final Widget child;
  const ShimmerWrap({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // highlightColor: Colors.grey[200]!,
      // baseColor: Colors.grey[350]!,
        highlightColor: Color(0xFFFFFFFF),
        baseColor: Color(0xFFF1F4FB),
        child: child);
  }
}