package com.zipbop.purchase.domain.repository;

import com.zipbop.purchase.domain.entity.Cart;
import com.zipbop.purchase.domain.entity.CartCheck;
import com.zipbop.purchase.domain.mapper.CartMapper;
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

    public void insert(Cart cart) {
        mapper.insert(cart);
    }

    public List<CartCheck> getListByMemberId(String member_id) {
        return mapper.getListByMemberId(member_id);
    }

    public void delete(int id) {
        mapper.delete(id);
    }

    public void deleteAll(String member_id) {
        mapper.deleteAll(member_id);
    }
}
