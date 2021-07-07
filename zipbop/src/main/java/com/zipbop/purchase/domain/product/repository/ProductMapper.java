package com.zipbop.purchase.domain.product.repository;

import com.zipbop.purchase.domain.product.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProductMapper {

    @Select("select * from product where id = #{id}")
    Product findOneById(int id);

    @Select("select * from product")
    List<Product> findAll();
}
