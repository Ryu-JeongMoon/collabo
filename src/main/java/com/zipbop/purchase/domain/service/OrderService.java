package com.zipbop.purchase.domain.service;

import com.zipbop.purchase.domain.entity.Order;
import com.zipbop.purchase.domain.repository.MybatisOrderRepository;
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

    public List<Order> getSpecificListByMemberId(int id) {
        return mybatisOrderRepository.getSpecificListByMemberId(id);
    }

    public int changeState(int uuid) {
        return mybatisOrderRepository.changeState(uuid);
    }

    public Integer getTotalSum(String member_id) {
        return mybatisOrderRepository.getTotalSum(member_id);
    }

    public int getSumByOrderId(int id) {
        return mybatisOrderRepository.getSumByOrderId(id);
    }

    public Order findOneByUuid(int uuid) {
        return mybatisOrderRepository.findOneByUuid(uuid);
    }
}
