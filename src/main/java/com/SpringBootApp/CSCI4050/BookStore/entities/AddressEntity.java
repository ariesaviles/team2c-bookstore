package com.SpringBootApp.CSCI4050.BookStore.entities;


import org.springframework.boot.autoconfigure.domain.EntityScan;

import javax.persistence.Entity;

@Entity(name = "address")
public class AddressEntity {

    private String street;
    private String city;
    private String state;
    private int zipCode;

    public AddressEntity(String street, String city, String state, int zipCode) {
      this.street = street;
      this.city = city;
      this.state = state;
      this.zipCode = zipCode;
    }
    
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
      String address = street + ", " + city + ", " + State + " " + String.valueOf(zipCode);
      return address ;
    }
 
}
