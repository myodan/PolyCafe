package dev.myodan.polycafe.repository;

import dev.myodan.polycafe.model.ProductImage;
import lombok.AllArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@AllArgsConstructor
public class ProductImageRepositoryImpl implements ProductImageRepository {

    private final SqlSession sqlSession;

    @Override
    public List<ProductImage> findAllByProductId(Long productId) {
        return sqlSession.selectList("productImageMapper.findAllByProductId", productId);
    }

    @Override
    public void create(ProductImage productImage) {
        sqlSession.insert("productImageMapper.create", productImage);
    }

    @Override
    public void deleteById(Long id) {
        sqlSession.delete("productImageMapper.deleteById", id);
    }

    @Override
    public void deleteAllByProductId(Long productId) {
        sqlSession.delete("productImageMapper.deleteAllByProductId", productId);
    }

}
