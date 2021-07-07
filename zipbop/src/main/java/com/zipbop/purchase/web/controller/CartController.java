package com.zipbop.purchase.web.controller;

import com.zipbop.purchase.domain.cart.Cart;
import com.zipbop.purchase.domain.cart.repository.CartCheck;
import com.zipbop.purchase.domain.cart.repository.MybatisCartRepository;
import com.zipbop.purchase.domain.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartController {

    private final CartService cartService;
    private final MybatisCartRepository cartRepository;

    @GetMapping("/list/{member_id}")
    public String list(@PathVariable String member_id, HttpSession session, Model model) {

        String loginId = (String) session.getAttribute("id");

        // TODO 통합 후 로그인 페이지로 보내기
        if (!member_id.equals(loginId)) {
            return "redirect:http://localhost:8080/product/productList";
        }

        List<CartCheck> cartChecks = cartService.getListByMemberId(member_id);

        int sum = 0;

        for (CartCheck cartCheck : cartChecks) {
            sum += cartCheck.getTotal_money();
        }

        model.addAttribute("member_id", member_id);
        model.addAttribute("sum", sum);
        model.addAttribute("cartChecks", cartChecks);

        return "cart/cartList";
    }

    //1. 장바구니 추가
    @PostMapping("/insert")
    public String insert(@ModelAttribute Cart cart, HttpSession session) {

        String member_id = (String) session.getAttribute("id");
        cart.setMember_id(member_id);

        System.out.println("cart : " + cart);
        System.out.println("cart = " + cart.getProduct_id());
        System.out.println("cart.getProduct_count() = " + cart.getProduct_count());

        cartService.insert(cart);

        int id = cart.getProduct_id();

        return "redirect:http://localhost:8080/product/productDetail/" + id;
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id, HttpServletRequest request, Model model) {

        HttpSession session = request.getSession();
        String loginId = (String) session.getAttribute("id");

        Cart cart = cartService.findById(id);

        if (!cart.getMember_id().equals(loginId)) {
            System.out.println("삭제 불가");
            return "redirect:http://localhost:8080/product/productList";
        }

        cartService.delete(id);

        //

        List<CartCheck> cartChecks = cartService.getListByMemberId(cart.getMember_id());

        int sum = 0;

        for (CartCheck cartCheck : cartChecks) {
            sum += cartCheck.getTotal_money();
        }

        model.addAttribute("member_id", loginId);
        model.addAttribute("sum", sum);
        model.addAttribute("cartChecks", cartChecks);

        return "cart/cartList";

    }

    @RequestMapping("/deleteAll/{member_id}")
    public String deleteAll(@PathVariable String member_id, @ModelAttribute Cart cart, HttpSession session) {

        String loginId = (String) session.getAttribute("id");

        if(!member_id.equals(loginId)) {
            System.out.println("삭제 불가");
            return "redirect:/cart/list/{member_id}";
        }

        cartService.deleteAll(member_id);

        return "redirect:/cart/list/{member_id}";
    }


}
