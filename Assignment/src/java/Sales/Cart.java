/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Sales;

import entity.Inventory;

/**
 *
 * @author savas
 */
public class Cart {
    private Order order = new Order();
    private double totalAmount;

    public void addToCart(Inventory product, int quantity) {
        //check if got same product in cart already then just increment quantity accordingly
        for (int i = 0; i < order.getProducts().size(); i++) {
            if (order.getProducts().get(i).getInvenid().equals(product.getInvenid())) {
                order.getQuantities().set(i, order.getQuantities().get(i) + quantity);
                System.out.println("Cart updated!");
                return;
            }
        }

        order.getProducts().add(product);
        order.getQuantities().add(quantity);
        System.out.println("Cart updated with new item!");
    }

    public double getTotalAmount() {
        double total = 0;
        for (int i = 0; i < order.getProducts().size(); i++) {
            total += order.getQuantities().get(i) * order.getProducts().get(i).getPrice().doubleValue();
        }

        totalAmount = total;
        return total;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

}
