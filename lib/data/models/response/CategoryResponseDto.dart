import 'package:e_commerce/domain/entities/category/CategoryResponseEntity.dart';

class CategoryResponseDto extends CategoryResponseEntity {
  CategoryResponseDto({
    super.results,
    super.metadata,
    super.data,
  });

  CategoryResponseDto.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? MetadataDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryDto.fromJson(v));
      });
    }
  }
}

class CategoryDto extends CategoryEntity {
  CategoryDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  CategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

class MetadataDto extends MetadataEntity {
  MetadataDto({
    super.currentPage,
    super.numberOfPages,
    super.limit,
  });

  MetadataDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }
}
