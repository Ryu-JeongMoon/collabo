package com.zipbop.purchase.domain.service;

import com.zipbop.purchase.domain.product.Product;
import com.zipbop.purchase.domain.product.repository.MybatisProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProductService {

    @Autowired
    private final MybatisProductRepository mybatisProductRepository;

    public Product findOneById(int id) {
        return mybatisProductRepository.findOneById(id);
    }
}
