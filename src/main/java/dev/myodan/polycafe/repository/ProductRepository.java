package dev.myodan.polycafe.repository;

import dev.myodan.polycafe.model.Product;
import dev.myodan.polycafe.util.Pageable;

import java.util.List;
import java.util.Set;

public interface ProductRepository {

    Long count();

    List<Product> findAll();

    List<Product> findAll(Pageable pageable);

    List<Product> findAll(Set<Long> keySet);

    Product findById(Long id);

    void create(Product product);

    void update(Product product);

    void deleteById(Long id);

}
