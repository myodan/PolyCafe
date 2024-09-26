package dev.myodan.polycafe.service;

import dev.myodan.polycafe.model.Product;
import dev.myodan.polycafe.repository.ProductImageRepository;
import dev.myodan.polycafe.repository.ProductRepository;
import dev.myodan.polycafe.util.Pageable;

import java.util.List;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;
    private final ProductImageRepository productImageRepository;

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public List<Product> findAll(Pageable pageable) {
        pageable.setCount(productRepository.count().intValue());
        return productRepository.findAll(pageable);
    }

    @Override
    public Product findById(Long id) {
        return productRepository.findById(id);
    }

    @Override
    @Transactional
    public void create(Product product) {
        productRepository.create(product);
        product.getProductImages().forEach(image -> {
            image.setProductId(product.getId());
            productImageRepository.create(image);
        });
    }

    @Override
    @Transactional
    public void update(Product product) {
        productRepository.update(product);
        product.getProductImages().forEach(image -> {
            image.setProductId(product.getId());
            productImageRepository.create(image);
        });
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        productImageRepository.deleteAllByProductId(id);
        productRepository.deleteById(id);
    }

}
