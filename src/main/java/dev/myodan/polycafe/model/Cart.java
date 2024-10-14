package dev.myodan.polycafe.model;

import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.Map;

@Getter
@Setter
public class Cart {
    private final Map<Long, Long> cart = new HashMap<>();

    public void push(Long productId, Long amount) {
        if (cart.containsKey(productId)) {
            cart.put(productId, cart.get(productId) + amount);
        } else {
            cart.put(productId, amount);
        }
    }
}
