package com.SpringBootApp.CSCI4050.BookStore.entities;

import javax.persistence.*;
import java.util.List;

@Entity(name = "order_table")
public class OrderEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idorder")
    private Long idOrder;

    @Column(name = "subcost")
    private double subCost;

    @Column(name = "orderdate")
    private String orderDate;

    @ManyToOne
    @JoinColumn(name = "user_iduser")
    private UserAccountEntity user_IDuser;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "card_idcard")
    private CardEntity card_IDcard;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "address_idaddress")
    private AddressEntity address_IDaddress;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "promotion_idpromotion")
    private PromotionEntity promotion_IDpromotion;

    @OneToMany(mappedBy = "order")
    List<OrderHasBooksEntity> orderHasBooks;

    public Long getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(Long idOrder) {
        this.idOrder = idOrder;
    }

    public double getSubCost() {
        return subCost;
    }

    public void setSubCost(double subCost) {
        this.subCost = subCost;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

}
