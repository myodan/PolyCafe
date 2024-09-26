package dev.myodan.polycafe.repository;


import dev.myodan.polycafe.model.ProductImage;

import java.util.List;

public interface ProductImageRepository {

    List<ProductImage> findAllByProductId(Long productId);

    void create(ProductImage productImage);

    void deleteById(Long id);

    void deleteAllByProductId(Long productId);

}
