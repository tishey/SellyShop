

import 'dart:convert';

Product doorDeliveryModelFromJson(String str) =>
    Product.fromJson(json.decode(str));

String doorDeliveryModelToJson(Product data) =>
    json.encode(data.toJson());
class Product {
  String name;
  String? description;
  String uniqueId;
  String urlSlug;
  bool isAvailable;
  bool isService;
  String? previousUrlSlugs;
  bool unavailable;
  String? unavailableStart;
  String? unavailableEnd;
  String id;
  String? parentProductId;
  String? parent;
  String organizationId;
  String? stockId;
  List<dynamic>? productImage; 
  List<dynamic>? categories; 
  String dateCreated;
  String lastUpdated;
  String userId;
  List<dynamic>? prices; 
  List<dynamic>? stocks; 
   List<Map<String, dynamic>>? photos;
   List<dynamic>? currentPrice;
  bool isDeleted;
  dynamic availableQuantity; 
  dynamic sellingPrice; 
  dynamic discountedPrice; 
  dynamic buyingPrice; 
  dynamic extraInfos; 
  dynamic featuredReviews; 
  List<dynamic>? unavailability; 

  Product({
    required this.name,
    this.description,
    required this.uniqueId,
    required this.urlSlug,
    required this.isAvailable,
    required this.isService,
    this.previousUrlSlugs,
    required this.unavailable,
    this.unavailableStart,
    this.unavailableEnd,
    required this.id,
    this.parentProductId,
    this.parent,
    required this.organizationId,
    this.stockId,
    this.productImage,
    this.categories,
    required this.dateCreated,
    required this.lastUpdated,
    required this.userId,
    this.photos,
    this.prices,
    this.stocks,
    this.currentPrice,
    required this.isDeleted,
    this.availableQuantity,
    this.sellingPrice,
    this.discountedPrice,
    this.buyingPrice,
    this.extraInfos,
    this.featuredReviews,
    this.unavailability,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json['name'] ?? '',
        description: json['description'],
        uniqueId: json['unique_id'] ?? '',
        urlSlug: json['url_slug'] ?? '',
        isAvailable: json['is_available'] ?? false,
        isService: json['is_service'] ?? false,
        previousUrlSlugs: json['previous_url_slugs'] ?? '', 
        unavailable: json['unavailable'] ?? false,
        unavailableStart: json['unavailable_start'] ?? '',
        unavailableEnd: json['unavailable_end'] ?? '',
        id: json['id'] ?? '',
        parentProductId: json['parent_product_id'] ?? '',
        parent: json['parent'] ?? '',
        organizationId: json['organization_id'] ?? '',
        stockId: json['stock_id'] ?? '',
        productImage: json['product_image'] ?? [],
        categories: json['categories'] ?? [],
        dateCreated: json['date_created'] ?? '',
        lastUpdated: json['last_updated'] ?? '',
        userId: json['user_id'] ?? '',
        photos: json['photos'] != null ? List<Map<String, dynamic>>.from(json['photos']) : [],
      currentPrice: json['current_price'] != null ? List<dynamic>.from(json['current_price'][0]['NGN']) : [],
        prices: json['prices'] ?? [],
        stocks: json['stocks'] ?? [], 
        isDeleted: json['is_deleted'] ?? false,
        availableQuantity: json['available_quantity'],
        sellingPrice: json['selling_price'],
        discountedPrice: json['discounted_price'],
        buyingPrice: json['buying_price'],
        extraInfos: json['extra_infos'],
        featuredReviews: json['featured_reviews'],
        unavailability: json['unavailability'] ?? [],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'unique_id': uniqueId,
        'url_slug': urlSlug,
        'is_available': isAvailable,
        'is_service': isService,
        'previous_url_slugs': previousUrlSlugs,
        'unavailable': unavailable,
        'unavailable_start': unavailableStart,
        'unavailable_end': unavailableEnd,
        'id': id,
        'parent_product_id': parentProductId,
        'parent': parent,
        'organization_id': organizationId,
        'stock_id': stockId,
        'product_image': productImage,
        'categories': categories,
        'date_created': dateCreated,
        'last_updated': lastUpdated,
        'user_id': userId,
        'photos': photos,
        'prices': prices,
        'stocks': stocks,
        'current_price': currentPrice,
        'is_deleted': isDeleted,
        'available_quantity': availableQuantity,
        'selling_price': sellingPrice,
        'discounted_price': discountedPrice,
        'buying_price': buyingPrice,
        'extra_infos': extraInfos,
        'featured_reviews': featuredReviews,
        'unavailability': unavailability,
      };
}
