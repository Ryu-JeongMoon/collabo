package com.zipbop.purchase.web.controller;

import com.zipbop.member.domain.member.Member;
import com.zipbop.purchase.domain.entity.CartCheck;
import com.zipbop.purchase.domain.entity.Order;
import com.zipbop.purchase.domain.service.CartService;
import com.zipbop.purchase.domain.service.OrderService;
import com.zipbop.purchase.web.controller.form.OrderForm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {

    private final CartService cartService;
    private final OrderService orderService;

    @GetMapping("/orderDetail/{member_id}")
    public String orderDetail(@PathVariable String member_id, HttpSession session, Model model) {

        Member loginMember = (Member) session.getAttribute("loginMember");

        if (!member_id.equals(loginMember.getId())) {
            return "redirect:/";
        }

        List<Order> orders = orderService.getListByMemberId(member_id);
        List<CartCheck> cartChecks = cartService.getListByMemberId(member_id);

        int sum = 0;

        for (CartCheck cartCheck : cartChecks) {
            sum += cartCheck.getTotal_money();
        }

        model.addAttribute("member_id", member_id);
        model.addAttribute("sum", sum);
        model.addAttribute("cartChecks", cartChecks);
        model.addAttribute("orders", orders);

        return "purchase/order/orderDetail";
    }

    @PostMapping("/add/{member_id}")
    public String addOrder(@PathVariable String member_id, HttpServletRequest request, @ModelAttribute("orderForm") OrderForm orderForm, Model model) {

        HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");

        String referer = request.getHeader("Referer");

        if (!member_id.equals(loginMember.getId())) {
            return "redirect:/";
        }

        List<CartCheck> cartChecks = cartService.getListByMemberId(member_id);

        int sum = 0;

        for (CartCheck cartCheck : cartChecks) {
            sum += cartCheck.getTotal_money();
        }

        int id = orderService.findNextId();

        for (CartCheck cartCheck : cartChecks) {
            Order order = new Order();
            order.setId(id);
            order.setMember_id(member_id);
            order.setReceiver(orderForm.getReceiver());
            order.setAddress(orderForm.getAddress());
            order.setPhone(orderForm.getPhone());

            order.setCart_id(cartCheck.getId());
            order.setProduct_name(cartCheck.getName());
            order.setProduct_price(cartCheck.getPrice());
            order.setProduct_count(cartCheck.getProduct_count());
            order.setTotal_price(sum);
            order.setState("ORDER");

            orderService.insert(order);
        }

        if(referer.contains("/order/orderDetail")) {
            model.addAttribute("isOrdered", true);
        }

        cartService.deleteAll(member_id);
        List<Order> orders = orderService.getListById(id);
        int orderSum = orderService.getSumByOrderId(id);

        Map<Integer, Integer> interval = new ConcurrentHashMap<>();
        LocalDateTime now = LocalDateTime.now();

        orders.forEach(o -> interval.put(o.getUuid(), now.compareTo(o.getRegdate())));

        model.addAttribute("interval", interval);
        model.addAttribute("sum", orderSum);
        model.addAttribute("orders", orders);

        return "purchase/order/orderList";
    }

    @GetMapping("/list/{member_id}")
    public String orderList(@PathVariable String member_id, Model model) {
        List<Order> orders = orderService.getListByMemberId(member_id);
        int sum = 0;
        sum = orderService.getTotalSum(member_id);

        Map<Integer, Integer> interval = new ConcurrentHashMap<>();
        LocalDateTime now = LocalDateTime.now();

        orders.forEach(o -> interval.put(o.getUuid(), now.compareTo(o.getRegdate())));

        model.addAttribute("interval", interval);
        model.addAttribute("orders", orders);
        model.addAttribute("sum", sum);
        return "purchase/order/orderList";
    }

    @GetMapping("/refund/{uuid}")
    public String refund(@PathVariable int uuid, HttpServletRequest request, Model model) {

        Member loginMember = (Member) request.getSession().getAttribute("loginMember");

        String referer = request.getHeader("Referer");
        List<Order> orders = new ArrayList<>();
        int sum = 0;

        Order order = orderService.findOneByUuid(uuid);
        if(!(loginMember.getId().equals(order.getMember_id())))
            return "redirect:/";

        orderService.changeState(uuid);

        if (referer.contains("/order/add/")) {
            orders = orderService.getSpecificListByMemberId(order.getId());
            sum = orderService.getSumByOrderId(order.getId());
        } else {
            orders = orderService.getListByMemberId(order.getMember_id());
            sum = orderService.getTotalSum(order.getMember_id());
        }

        Map<Integer, Integer> interval = new ConcurrentHashMap<>();
        LocalDateTime now = LocalDateTime.now();

        orders.forEach(o -> interval.put(o.getUuid(), now.compareTo(o.getRegdate())));

        model.addAttribute("interval", interval);
        model.addAttribute("orders", orders);
        model.addAttribute("sum", sum);

        return "purchase/order/orderList";
    }
}
