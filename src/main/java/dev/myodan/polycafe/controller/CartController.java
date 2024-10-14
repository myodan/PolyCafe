package dev.myodan.polycafe.controller;

import dev.myodan.polycafe.model.Cart;
import dev.myodan.polycafe.model.Member;
import dev.myodan.polycafe.model.Product;
import dev.myodan.polycafe.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {
    private final ProductService productService;

    @GetMapping
    String getCart(@SessionAttribute Cart cart, Model model) {
        List<Product> list = productService.findAll(cart.getCart().keySet());
        model.addAttribute("list", list);
        return "cart";
    }

    @ResponseBody
    @GetMapping("/{productId}")
    Cart pushCart(
            @PathVariable Long productId,
            @RequestParam(defaultValue = "1") Long amount,
            @SessionAttribute Member member,
            @SessionAttribute(required = false) Cart cart,
            HttpSession session
    ) {
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        cart.push(productId, amount);

        return cart;
    }

}
