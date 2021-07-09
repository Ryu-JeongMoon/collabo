package com.zipbop.purchase.domain.repository;

import com.zipbop.purchase.domain.entity.Order;
import com.zipbop.purchase.domain.mapper.OrderMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@RequiredArgsConstructor
@Repository
public class MybatisOrderRepository {

    private final OrderMapper mapper;

    public void insert(Order order) {
        mapper.insert(order);
    }

    public int findNextId() {
        return mapper.findNextId();
    }

    public List<Order> getListById(int id) {
        return mapper.getListById(id);
    }

    public List<Order> getListByMemberId(String member_id) {
        return mapper.getListByMemberId(member_id);
    }

    public List<Order> getSpecificListByMemberId(String member_id, int id) {
        return mapper.getSpecificListByMemberId(member_id, id);
    }

    public int changeState(String state, int uuid) {
        return mapper.changeState(state, uuid);
    }

    public int getTotalSum(String member_id) {
        return mapper.getTotalSum(member_id);
    }

    public int getSumByOrderId(int id) {
        return mapper.getSumByOrderId(id);
    }

    public Order findOneByUuid(int uuid) {
        return mapper.findOneByUuid(uuid);
    }
}
