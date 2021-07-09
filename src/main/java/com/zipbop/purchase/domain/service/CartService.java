package com.zipbop.purchase.domain.service;

import com.zipbop.purchase.domain.entity.Cart;
import com.zipbop.purchase.domain.entity.CartCheck;
import com.zipbop.purchase.domain.repository.MybatisCartRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService {

    private final MybatisCartRepository mybatisCartRepository;

    public Cart findById(int id) {
        return mybatisCartRepository.findById(id);
    }

    public void insert(Cart cart) {
        mybatisCartRepository.insert(cart);
    }

    public List<CartCheck> getListByMemberId(String member_id){
        return mybatisCartRepository.getListByMemberId(member_id);
    }

    public void delete(int id) {
        mybatisCartRepository.delete(id);
    }

    public void deleteAll(String member_id) {
        mybatisCartRepository.deleteAll(member_id);
    }
}
