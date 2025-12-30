import 'package:clean_architecture_practice/features/product/domain/entity/products_entity.dart';


class ProductModel extends ProductsEntity {
  ProductModel({
    super.id,
    super.title,
    super.description,
    super.category,
    super.price,
    super.image
  });
  
  factory ProductModel.fromJson(Map<String, dynamic> json)  => ProductModel(
    id : json['id'],
    title : json['title'],
    price : (json['price'] as num).toDouble(),
    description : json['description'],
    category : json['category'],
    image : json['image']
    
  );
}