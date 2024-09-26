package dev.myodan.polycafe.service;

import dev.myodan.polycafe.model.ProductImage;

import java.util.List;

public interface ProductImageService {

    List<ProductImage> findAllByProductId(Long productId);

    void deleteById(Long id);

    void create(ProductImage productImage);

}
