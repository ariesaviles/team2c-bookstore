package com.SpringBootApp.CSCI4050.BookStore.entities;

import javax.persistence.*;
import java.util.Set;

@Entity(name = "address")
public class AddressEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idaddress")
    private Long idAddress;

    @Column(name = "street")
    private String street;

    @Column(name = "city")
    private String city;

    @Column(name = "state")
    private String state;

    @Column(name = "zipcode")
    private int zipCode;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_iduser", nullable = false)
    private UserAccountEntity user_IDuser;

    @OneToMany(mappedBy = "address_IDaddress", targetEntity = OrderEntity.class)
    private Set<OrderEntity> orders;

    public Long getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(Long idAddress) {
        this.idAddress = idAddress;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getZipCode() {
        return zipCode;
    }

    public void setZipCode(int zipCode) {
        this.zipCode = zipCode;
    }

    public UserAccountEntity getUser_IDuser() {
        return user_IDuser;
    }

    public void setUser_IDuser(UserAccountEntity user_IDuser) {
        this.user_IDuser = user_IDuser;
    }

    /*
    public Set<OrderEntity> getOrders() {
        return orders;
    }

    public void setOrders(Set<OrderEntity> orders) {
        this.orders = orders;
    }

     */
}
