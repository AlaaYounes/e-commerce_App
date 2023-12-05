class CategoryResponseEntity {
  CategoryResponseEntity({
    this.results,
    this.metadata,
    this.data,
  });

  num? results;
  MetadataEntity? metadata;
  List<CategoryEntity>? data;
}

class CategoryEntity {
  CategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
}

class MetadataEntity {
  MetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  num? currentPage;
  num? numberOfPages;
  num? limit;
}
