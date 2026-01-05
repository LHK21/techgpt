/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Sales;
import entity.Inventory;
import java.util.ArrayList;
/**
 *
 * @author savas
 */
public class Order {
    private ArrayList<Inventory> products = new ArrayList<Inventory>();
    private ArrayList<Integer> quantities = new ArrayList<Integer>();

    public ArrayList<Inventory> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<Inventory> products) {
        this.products = products;
    }

    public ArrayList<Integer> getQuantities() {
        return quantities;
    }

    public void setQuantities(ArrayList<Integer> quantities) {
        this.quantities = quantities;
    }
    
    
    
    
}
