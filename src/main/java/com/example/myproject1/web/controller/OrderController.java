package com.example.myproject1.web.controller;

import com.example.myproject1.domain.item.Item;
import com.example.myproject1.domain.member.Member;
import com.example.myproject1.domain.order.Order;
import com.example.myproject1.mapper.ItemMapper;
import com.example.myproject1.mapper.MemberMapper;
import com.example.myproject1.mapper.OrderMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {
    private final OrderMapper orderMapper;
    private final MemberMapper memberMapper;
    private final ItemMapper itemMapper;

    @PostMapping("/insert")
    public String insert(@ModelAttribute Order order, BindingResult bindingResult,
                         Model model, RedirectAttributes rttr) {
        orderMapper.insert(order);
        return "redirect:/order/orders";
    }

    @GetMapping("/orders")
    public String Orders(@ModelAttribute Order selected, Model model) {
        List<Order> OrderList = orderMapper.findAllOrders();
        List<Member> memberList = memberMapper.findAllMembers();
        List<Item> itemList = itemMapper.findAllItems();

        model.addAttribute("orders", OrderList);
        model.addAttribute("members", memberList);
        model.addAttribute("items", itemList);
        model.addAttribute("order", selected);
        return "order/orders";
    }

    @GetMapping("/select")
    public String Select(String search,Model model,RedirectAttributes rttr) {
        Order selectedOrder = orderMapper.selectOrder(search);
        rttr.addFlashAttribute("selected", selectedOrder);
        return "redirect:/order/orders";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute Order order, int prevId, RedirectAttributes rttr) {
        int rowCount = orderMapper.update(order,prevId);
        rttr.addFlashAttribute("message", rowCount + " 개 수정됨!");
        return "redirect:/order/orders";
    }

    @PostMapping("/delete")
    public String delete(Order order, RedirectAttributes rttr) {
        int rowCount = orderMapper.delete(order);
        rttr.addFlashAttribute("message", rowCount + " 명 삭제됨!");
        return "redirect:/order/orders";
    }

    @GetMapping("/getOrderProductPrice")
    @ResponseBody
    public String getOrderProductPrice(Order order, Model model) {
        Integer itemPrice = orderMapper.findItemPrice(order);
        return itemPrice.toString();
    }
}
