package com.zipbop.purchase.domain.service;

import com.zipbop.purchase.domain.cart.Cart;
import com.zipbop.purchase.domain.cart.repository.CartCheck;
import com.zipbop.purchase.domain.cart.repository.MybatisCartRepository;
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

    //장바구니 추가
    public void insert(Cart cart) {
        mybatisCartRepository.insert(cart);
    }

    //장바구니 목록
    public List<CartCheck> getListByMemberId(String member_id){
        System.out.println("id : "+member_id);
        return mybatisCartRepository.getListByMemberId(member_id);
    }

    //장바구니 삭제
    public void delete(int id) {
        mybatisCartRepository.delete(id);
    }

    //장바구니 전체 삭제
    public void deleteAll(String member_id) {
        mybatisCartRepository.deleteAll(member_id);
    }


}
