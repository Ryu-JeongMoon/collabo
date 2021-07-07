package com.zipbop.purchase.domain.cart.repository;

import com.zipbop.purchase.domain.cart.Cart;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@RequiredArgsConstructor
@Repository
public class MybatisCartRepository {

    private final CartMapper mapper;

    public Cart findById(int id) {
        return mapper.findById(id);
    }

    //장바구니 추가
    public void insert(Cart cart) {
        mapper.insertCart(cart);
    }

    //장바구니 목록
    public List<CartCheck> getListByMemberId(String member_id) {
        return mapper.getListByMemberId(member_id);
    }

    //장바구니 삭제
    public void delete(int id) {
        mapper.delete(id);
    }

    //장바구니 전체 삭제
    public void deleteAll(String member_id) {
        mapper.deleteAll(member_id);
    }
}
