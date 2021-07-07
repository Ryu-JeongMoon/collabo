package com.zipbop.purchase.domain.service;

import com.zipbop.purchase.domain.order.Order;
import com.zipbop.purchase.domain.order.repository.MybatisOrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final MybatisOrderRepository mybatisOrderRepository;

    public void insert(Order order) {
        mybatisOrderRepository.insert(order);
    }

    public int findNextId() {
        return mybatisOrderRepository.findNextId();
    }

    public List<Order> getListById(int id) {
        return mybatisOrderRepository.getListById(id);
    }

    public List<Order> getListByMemberId(String member_id) {
        return mybatisOrderRepository.getListByMemberId(member_id);
    }

    public List<Order> getSpecificListByMemberId(String member_id, int id) {
        return mybatisOrderRepository.getSpecificListByMemberId(member_id, id);
    }

    public int changeState(String state, int uuid) {
        return mybatisOrderRepository.changeState(state, uuid);
    }

    public int getTotalSum(String member_id) {
        return mybatisOrderRepository.getTotalSum(member_id);
    }

    public int getSumByOrderId(int id) {
        return mybatisOrderRepository.getSumByOrderId(id);
    }

    public Order findOneByUuid(int uuid) {
        return mybatisOrderRepository.findOneByUuid(uuid);
    }
}
