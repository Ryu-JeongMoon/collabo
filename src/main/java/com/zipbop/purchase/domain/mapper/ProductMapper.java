package com.zipbop.purchase.domain.mapper;

import com.zipbop.purchase.domain.entity.Product;
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
