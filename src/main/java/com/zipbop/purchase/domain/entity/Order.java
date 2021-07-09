package com.zipbop.purchase.domain.entity;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class Order {
    private int uuid;
    private int id;
    private String member_id;
    private String receiver;
    private String address;
    private String phone;

    private int cart_id;
    private String product_name;
    private int product_price;
    private int product_count;
    private int total_price;
    private LocalDateTime regdate;

    private String state;
}
