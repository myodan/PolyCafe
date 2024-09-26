package dev.myodan.polycafe.repository;

import dev.myodan.polycafe.model.Product;
import dev.myodan.polycafe.util.Pageable;

import java.util.List;

public interface ProductRepository {

    Long count();

    List<Product> findAll();

    List<Product> findAll(Pageable pageable);

    Product findById(Long id);

    void create(Product product);

    void update(Product product);

    void deleteById(Long id);

}
