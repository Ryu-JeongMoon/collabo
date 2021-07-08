package com.zipbop.purchase.domain.order.repository;

import com.zipbop.purchase.domain.order.Order;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface OrderMapper {

    @Select("select * from orders where uuid = #{uuid}")
    Order findOneByUuid(int uuid);

    @Insert("insert into orders values(#{id}, #{member_id} , #{receiver}, #{address} , #{phone} , sysdate, seq_orders.nextval, #{cart_id}, " +
            "#{product_name}, #{product_price}, #{product_count}, #{total_price}, #{state})")
    void insert(Order order);

    @Select("select (max(id)+1) from orders")
    int findNextId();

    @Select("select * from orders where id = #{id} and state = 'ORDER' order by id desc")
    List<Order> getListById(int id);

    @Select("select * from orders where member_id = #{member_id} and state = 'ORDER' order by id desc")
    List<Order> getListByMemberId(String member_id);

    @Select("select * from orders where member_id = #{member_id} and state = 'ORDER' and id = #{id}")
    List<Order> getSpecificListByMemberId(String member_id, int id);

    @Select("select sum(product_count * product_price) from orders where id = #{id} and state = 'ORDER' group by member_id")
    int getSumByOrderId(int id);

    @Update("update orders set state = #{state} where uuid = #{uuid}")
    int changeState(String state, int uuid);

    @Select("select sum(product_count * product_price) from orders where member_id = #{member_id} and state = 'ORDER' group by member_id")
    int getTotalSum(String member_id);

}