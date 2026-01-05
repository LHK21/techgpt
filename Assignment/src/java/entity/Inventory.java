/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.Base64;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Loo Hong Kheng
 */
@Entity
@Table(name = "INVENTORY")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Inventory.findAll", query = "SELECT i FROM Inventory i"),
    @NamedQuery(name = "Inventory.findByInvenid", query = "SELECT i FROM Inventory i WHERE i.invenid = :invenid"),
    @NamedQuery(name = "Inventory.findByName", query = "SELECT i FROM Inventory i WHERE i.name = :name"),
    @NamedQuery(name = "Inventory.findByPrice", query = "SELECT i FROM Inventory i WHERE i.price = :price"),
    @NamedQuery(name = "Inventory.findByDescription", query = "SELECT i FROM Inventory i WHERE i.description = :description"),
    @NamedQuery(name = "Inventory.findByDiscount", query = "SELECT i FROM Inventory i WHERE i.discount = :discount"),
    @NamedQuery(name = "Inventory.findByCategory", query = "SELECT i FROM Inventory i WHERE i.catid = :catid")})
public class Inventory implements Serializable {

    @Size(max = 50)
    @Column(name = "NAME")
    private String name;
    @Size(max = 100)
    @Column(name = "DESCRIPTION")
    private String description;
    @Lob
    @Column(name = "PICTURE")
    private byte[] picture;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "inventory")
    private List<Orderdetails> orderdetailsList;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "INVENID")
    private String invenid;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "PRICE")
    private BigDecimal price;
    @Column(name = "DISCOUNT")
    private BigDecimal discount;
    @JoinColumn(name = "CATID", referencedColumnName = "CATID")
    @ManyToOne
    private Category catid;

    public Inventory() {
    }

    public Inventory(String invenid,String name,BigDecimal price,String description,byte[] picture,BigDecimal discount,Category cat) {
        this.invenid = invenid;
        this.name=name;
        this.price=price;
        this.description=description;
        this.picture=picture;
        this.discount=discount;
        this.catid=cat;
    }
    
    public Inventory(String invenid) {
        this.invenid = invenid;
    }
    
    public String getInvenid() {
        return invenid;
    }

    public void setInvenid(String invenid) {
        this.invenid = invenid;
    }


    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }


    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public Category getCatid() {
        return catid;
    }

    public void setCatid(Category catid) {
        this.catid = catid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (invenid != null ? invenid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Inventory)) {
            return false;
        }
        Inventory other = (Inventory) object;
        if ((this.invenid == null && other.invenid != null) || (this.invenid != null && !this.invenid.equals(other.invenid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Inventory[ invenid=" + invenid + " ]";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPicture() {
        String pic = Base64.getEncoder().encodeToString(picture);
        return pic;
    }

    public void setPicture(byte[] picture) {
        this.picture = picture;
    }

    @XmlTransient
    public List<Orderdetails> getOrderdetailsList() {
        return orderdetailsList;
    }

    public void setOrderdetailsList(List<Orderdetails> orderdetailsList) {
        this.orderdetailsList = orderdetailsList;
    }
    
}
