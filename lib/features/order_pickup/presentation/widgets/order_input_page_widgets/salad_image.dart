import 'package:flutter/material.dart';

class SaladImage extends StatelessWidget {
  const SaladImage({
    super.key,
    required this.saladCatList,
    required this.index,
  });

  final List saladCatList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://static.stadtsalat.de/shop/image/${saladCatList[index]['image']}',
      // handling network error on image loading
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Text('Network problem');
      },
    );
  }
}
