package com.SpringBootApp.CSCI4050.BookStore.entities;


import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "user")
public class UserAccountEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long IDuser;

    @Column(name = "username")
    private String userName;

    @Column(name = "password")
    private String password;

    @Column(name = "firstname")
    private String firstName;

    @Column(name = "lastname")
    private String lastName;

    @Column(name="isadmin")
    private boolean isAdmin;

    @Column(name = "email")
    private String email;

    @Column(name = "birthdate")
    private String birthDate;

    @Column(name = "ispromotion")
    private boolean isPromotion;

    @Column(name = "userstate")
    private String userState;

    public Set<AddressEntity> getAddresses() {
        return addresses;
    }

    public void setAddresses(Set<AddressEntity> addresses) {
        this.addresses = addresses;
    }

    // Addresses
    @OneToMany(mappedBy = "user_IDuser")
    private Set<AddressEntity> addresses;

    // Orders
    @OneToMany(mappedBy = "user_IDuser", targetEntity = OrderEntity.class)
    private Set<OrderEntity> orders;

    public Long getIDuser() { return IDuser; }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String dateOfBirth) {
        this.birthDate = dateOfBirth;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public boolean getIsAdmin() { return isAdmin; }

    public void setIsAdmin(boolean isAdmin) { this.isAdmin = isAdmin; }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean getIsPromotion() { return isPromotion; }

    public void setIsPromotion(boolean isPromotion) { this.isPromotion = isPromotion; }

    public String getUserState() {
        return userState;
    }

    public void setUserState(String userState) {
        this.userState = userState;
    }

}
