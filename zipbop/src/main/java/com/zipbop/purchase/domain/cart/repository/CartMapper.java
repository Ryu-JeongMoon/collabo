package com.zipbop.purchase.domain.cart.repository;

import com.zipbop.purchase.domain.cart.Cart;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CartMapper {

    @Insert("insert into cart\n" +
            "        values ((select max(id) + 1 from cart), #{product_id}, #{member_id}, #{product_count})")
    void insertCart(Cart cart);

    @Select("select * from cart where id = #{id}")
    Cart findById(int id);

    @Select("select * from cart_check_view where member_id = #{member_id}")
    List<CartCheck> getListByMemberId(String member_id);

    @Delete("delete cart where id = #{id}")
    void delete(int id);

    @Delete("delete cart where member_id = #{member_id}")
    void deleteAll(String member_id);


}
