package com.zipbop.purchase.domain.product.repository;

import com.zipbop.purchase.domain.product.Product;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class MybatisProductRepository {

    private final ProductMapper mapper;

    public Product findOneById(int id) {
        return mapper.findOneById(id);
    }

    //상품리스트
    public List<Product> findAll() {
        return mapper.findAll();
    }
}
