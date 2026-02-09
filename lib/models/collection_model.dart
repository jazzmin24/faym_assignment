class ProductImage {
  final String id;
  final String imageUrl;

  ProductImage({
    required this.id,
    required this.imageUrl,
  });
}

class ProductCollection {
  final String id;
  final String title;
  final List<ProductImage> images;

  ProductCollection({
    required this.id,
    required this.title,
    required this.images,
  });
}
