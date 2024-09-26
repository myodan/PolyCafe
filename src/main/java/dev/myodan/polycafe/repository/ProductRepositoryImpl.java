package dev.myodan.polycafe.repository;

import dev.myodan.polycafe.model.Product;
import dev.myodan.polycafe.util.Pageable;
import lombok.AllArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@AllArgsConstructor
public class ProductRepositoryImpl implements ProductRepository {

    private final SqlSession sqlSession;

    @Override
    public Long count() {
        return sqlSession.selectOne("productMapper.count");
    }

    @Override
    public List<Product> findAll() {
        return sqlSession.selectList("productMapper.findAll");
    }

    @Override
    public List<Product> findAll(Pageable pageable) {
        return sqlSession.selectList("productMapper.findAllPageable", pageable);
    }

    @Override
    public Product findById(Long id) {
        return sqlSession.selectOne("productMapper.findById", id);
    }

    @Override
    public void create(Product product) {
        sqlSession.insert("productMapper.create", product);
    }

    @Override
    public void update(Product product) {
        sqlSession.update("productMapper.update", product);
    }

    @Override
    public void deleteById(Long id) {
        sqlSession.delete("productMapper.deleteById", id);
    }

}
