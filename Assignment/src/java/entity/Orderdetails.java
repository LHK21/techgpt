/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Loo Hong Kheng
 */
@Entity
@Table(name = "ORDERDETAILS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orderdetails.findAll", query = "SELECT o FROM Orderdetails o"),
    @NamedQuery(name = "Orderdetails.findByOrderid", query = "SELECT o FROM Orderdetails o WHERE o.orderdetailsPK.orderid = :orderid"),
    @NamedQuery(name = "Orderdetails.findByInvenid", query = "SELECT o FROM Orderdetails o WHERE o.orderdetailsPK.invenid = :invenid"),
    @NamedQuery(name = "Orderdetails.findByQuantity", query = "SELECT o FROM Orderdetails o WHERE o.quantity = :quantity")})
public class Orderdetails implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected OrderdetailsPK orderdetailsPK;
    @Column(name = "QUANTITY")
    private Long quantity;
    @JoinColumn(name = "INVENID", referencedColumnName = "INVENID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Inventory inventory;
    @JoinColumn(name = "ORDERID", referencedColumnName = "ORDERID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Orders orders;

    public Orderdetails() {
    }

    public Orderdetails(OrderdetailsPK orderdetailsPK) {
        this.orderdetailsPK = orderdetailsPK;
    }
    
    public Orderdetails(OrderdetailsPK orderdetailsPK,Long quantity,Inventory inventory,Orders orders) {
        this.orderdetailsPK = orderdetailsPK;
        this.quantity=quantity;
        this.inventory=inventory;
        this.orders=orders;
    }
    
    public Orderdetails(OrderdetailsPK orderdetailsPK,Inventory inventory,Orders orders) {
        this.orderdetailsPK = orderdetailsPK;
        this.inventory=inventory;
        this.orders=orders;
    }
    public Orderdetails(String orderid, String invenid) {
        this.orderdetailsPK = new OrderdetailsPK(orderid, invenid);
    }

    public OrderdetailsPK getOrderdetailsPK() {
        return orderdetailsPK;
    }

    public void setOrderdetailsPK(OrderdetailsPK orderdetailsPK) {
        this.orderdetailsPK = orderdetailsPK;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public Inventory getInventory() {
        return inventory;
    }

    public void setInventory(Inventory inventory) {
        this.inventory = inventory;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderdetailsPK != null ? orderdetailsPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orderdetails)) {
            return false;
        }
        Orderdetails other = (Orderdetails) object;
        if ((this.orderdetailsPK == null && other.orderdetailsPK != null) || (this.orderdetailsPK != null && !this.orderdetailsPK.equals(other.orderdetailsPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Orderdetails[ orderdetailsPK=" + orderdetailsPK + " ]";
    }
    
}
