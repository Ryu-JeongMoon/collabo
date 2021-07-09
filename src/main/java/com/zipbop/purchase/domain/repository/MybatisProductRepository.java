package com.zipbop.purchase.domain.repository;

import com.zipbop.purchase.domain.entity.Product;
import com.zipbop.purchase.domain.mapper.ProductMapper;
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

    public List<Product> findAll() {
        return mapper.findAll();
    }
}
