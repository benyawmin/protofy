import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';

class SaladImage extends StatelessWidget {
  const SaladImage({
    super.key,
    required this.saladCatList,
    required this.index,
  });

  final List<Product> saladCatList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'https://static.stadtsalat.de/shop/image/${saladCatList[index].image}',
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          const SizedBox.shrink(),
      errorWidget: (context, url, error) => const Icon(
          Icons.signal_wifi_statusbar_connected_no_internet_4_outlined),
    );
  }
}
