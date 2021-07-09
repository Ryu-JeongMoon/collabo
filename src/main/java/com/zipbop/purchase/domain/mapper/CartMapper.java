package com.zipbop.purchase.domain.mapper;

import com.zipbop.purchase.domain.entity.Cart;
import com.zipbop.purchase.domain.entity.CartCheck;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CartMapper {

    @Insert("insert into cart values ((select max(id) + 1 from cart), #{product_id}, #{member_id}, #{product_count})")
    void insert(Cart cart);

    @Select("select * from cart where id = #{id}")
    Cart findById(int id);

    @Select("select * from cart_check_view where member_id = #{member_id}")
    List<CartCheck> getListByMemberId(String member_id);

    @Delete("delete cart where id = #{id}")
    void delete(int id);

    @Delete("delete cart where member_id = #{member_id}")
    void deleteAll(String member_id);

}
