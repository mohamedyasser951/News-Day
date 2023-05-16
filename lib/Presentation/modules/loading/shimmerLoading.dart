import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GetShimmerLoading extends StatelessWidget {
 final Widget widget;
  const GetShimmerLoading({required this.widget,super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: widget,
      baseColor: Colors.grey,
      highlightColor: Colors.grey.withOpacity(0.4),
    );
  }
}