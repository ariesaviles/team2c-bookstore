package com.SpringBootApp.CSCI4050.BookStore.entities;


import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;

import javax.persistence.*;

@Entity(name = "user")
public class UserAccountEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
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

    public boolean isAdmin() { return isAdmin; }

    public void setAdmin(boolean isAdmin) { this.isAdmin = isAdmin; }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean getPromotion() { return isPromotion; }

    public void setPromotion(boolean isPromotion) { this.isPromotion = isPromotion; }


}
