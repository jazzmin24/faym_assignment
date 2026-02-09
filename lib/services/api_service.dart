import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/collection_model.dart';

class ApiService {
  static const String _baseUrl = 'https://picsum.photos';

  Future<List<ProductCollection>> fetchCollections({int count = 15}) async {
    final List<ProductCollection> collections = [];

    for (int i = 0; i < count; i++) {
      final page = i + 1;
      final response = await http.get(
        Uri.parse('$_baseUrl/v2/list?page=$page&limit=6'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final images = data.map((item) {
          final picId = item['id'] as String;
          return ProductImage(
            id: picId,
            imageUrl: '$_baseUrl/id/$picId/300/400',
          );
        }).toList();

        collections.add(
          ProductCollection(
            id: 'collection_$page',
            title: 'Collection $page',
            images: images,
          ),
        );
      }
    }

    return collections;
  }
}
