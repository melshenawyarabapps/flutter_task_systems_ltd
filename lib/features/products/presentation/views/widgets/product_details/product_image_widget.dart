import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDAb-Pe8luqM9J1qF_kKTaljwK-CALy_DkS-PMa0-3-kALkygdZDORJ73kHKsMySH7XDqNTAlND-SMUiR7CIIMPZscBmSNdg53NQhdrNNAuJa25th_Tt6i7zaw7XFPjrSKz1YV1d6WV5aOavcEnwtsFPg4L7RMJtUwhgCDK3BxxzYhrsgA9D8xsLm2N4NkwLRwv1kyIsV5ewSC5VmOz9hdL1L6UGJPRrH3RZQNgbomqhu2ddttKJ48O3PfQvLLbbE91hdG1ICAVfMOu',
      ),
    );
  }
}
