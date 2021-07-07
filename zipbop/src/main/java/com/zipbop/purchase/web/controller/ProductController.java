package com.zipbop.purchase.web.controller;

import com.zipbop.purchase.domain.product.Product;
import com.zipbop.purchase.domain.product.repository.MybatisProductRepository;
import com.zipbop.purchase.domain.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
public class ProductController {

    private final ProductService productService;
    private final MybatisProductRepository productRepository;

    @GetMapping("/productList")
    public String productList(Product product, Model model){
        List<Product> list = productRepository.findAll();
        model.addAttribute("list", list);
        return "product/productList";
    }

    @GetMapping("/productDetail/{id}")
    public String productDetail(@PathVariable int id, Model model) {

        Product detailProduct = productService.findOneById(id);

        model.addAttribute("product", detailProduct); //Model 객체사용 View로 데이터 전달
        return "product/ProductDetail";
    }

}
