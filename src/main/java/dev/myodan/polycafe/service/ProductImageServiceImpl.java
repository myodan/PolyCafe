package dev.myodan.polycafe.service;

import dev.myodan.polycafe.model.ProductImage;
import dev.myodan.polycafe.repository.ProductImageRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ProductImageServiceImpl implements ProductImageService {

    private final ProductImageRepository productImageRepository;

    @Override
    public List<ProductImage> findAllByProductId(Long productId) {
        return productImageRepository.findAllByProductId(productId);
    }

    @Override
    public void deleteById(Long id) {
        productImageRepository.deleteById(id);
    }

    @Override
    public void create(ProductImage productImage) {
        productImageRepository.create(productImage);
    }

}
