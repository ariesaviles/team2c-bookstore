package com.SpringBootApp.CSCI4050.BookStore.entities;

import javax.persistence.*;
import java.util.List;

@Entity(name = "order_table")
public class OrderEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idorder")
    private Long idOrder;

    @Column(name = "subcost")
    private double subCost;

    @Column(name = "orderdate")
    private String orderDate;

    @ManyToOne
    @JoinColumn(name = "user_iduser", referencedColumnName = "iduser")
    private UserAccountEntity user_IDuser;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "card_idcard", referencedColumnName = "idcard")
    private CardEntity card_IDcard;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "address_idaddress", referencedColumnName = "idaddress")
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

    public UserAccountEntity getUser_IDuser() {
        return user_IDuser;
    }

    public void setUser_IDuser(UserAccountEntity user_IDuser) {
        this.user_IDuser = user_IDuser;
    }

    public CardEntity getCard_IDcard() {
        return card_IDcard;
    }

    public void setCard_IDcard(CardEntity card_IDcard) {
        this.card_IDcard = card_IDcard;
    }

    public AddressEntity getAddress_IDaddress() {
        return address_IDaddress;
    }

    public void setAddress_IDaddress(AddressEntity address_IDaddress) {
        this.address_IDaddress = address_IDaddress;
    }

    public PromotionEntity getPromotion_IDpromotion() {
        return promotion_IDpromotion;
    }

    public void setPromotion_IDpromotion(PromotionEntity promotion_IDpromotion) {
        this.promotion_IDpromotion = promotion_IDpromotion;
    }

    public List<OrderHasBooksEntity> getBooksInOrder() {
        return orderHasBooks;
    }

    public void setBooksInOrder(List<OrderHasBooksEntity> orderHasBooks) {
        this.orderHasBooks = orderHasBooks;
    }

}
