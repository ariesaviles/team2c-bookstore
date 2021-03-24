package com.SpringBootApp.CSCI4050.BookStore.entities;


import org.springframework.boot.autoconfigure.domain.EntityScan;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "address")
public class AddressEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String street;
    private String city;
    private String state;
    private int zipCode;

    
    public String getStreet() {
        return street;
    }
    
    public void setStreet(String street) {
        this.street= street;
    }

    public String getCity() {
        return city;
    }
    
    public void setCity(String city) {
        this.city= city;
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
  
    public String getFullAddress() {
      String address = street + ", " + city + ", " + state + " " + String.valueOf(zipCode);
      return address ;
    }
 
}
