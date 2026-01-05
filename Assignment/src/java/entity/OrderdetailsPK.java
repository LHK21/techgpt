/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Loo Hong Kheng
 */
@Embeddable
public class OrderdetailsPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "ORDERID")
    private String orderid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "INVENID")
    private String invenid;

    public OrderdetailsPK() {
    }

    public OrderdetailsPK(String orderid, String invenid) {
        this.orderid = orderid;
        this.invenid = invenid;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public String getInvenid() {
        return invenid;
    }

    public void setInvenid(String invenid) {
        this.invenid = invenid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderid != null ? orderid.hashCode() : 0);
        hash += (invenid != null ? invenid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderdetailsPK)) {
            return false;
        }
        OrderdetailsPK other = (OrderdetailsPK) object;
        if ((this.orderid == null && other.orderid != null) || (this.orderid != null && !this.orderid.equals(other.orderid))) {
            return false;
        }
        if ((this.invenid == null && other.invenid != null) || (this.invenid != null && !this.invenid.equals(other.invenid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.OrderdetailsPK[ orderid=" + orderid + ", invenid=" + invenid + " ]";
    }
    
}
