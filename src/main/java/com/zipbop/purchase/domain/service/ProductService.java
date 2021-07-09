package com.zipbop.purchase.domain.service;

import com.zipbop.purchase.domain.entity.Product;
import com.zipbop.purchase.domain.repository.MybatisProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final MybatisProductRepository mybatisProductRepository;

    public Product findOneById(int id) {
        return mybatisProductRepository.findOneById(id);
    }
}
