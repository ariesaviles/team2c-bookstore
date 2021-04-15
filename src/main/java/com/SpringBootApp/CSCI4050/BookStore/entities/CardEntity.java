package com.SpringBootApp.CSCI4050.BookStore.entities;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;

import javax.persistence.*;
import java.sql.Date;

@Entity(name = "card")
public class CardEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    //@Column(name = "idcard")
    private Long idCard;

    @Column(name = "cardtype")
    private String cardType;

    @Column(name = "expirationdate")
    private String expirationDate;

    @Column(name = "cardholdername")
    private String cardHolderName;

    @Column(name = "cardnumber")
    private String cardNumber;

    @Column(name = "cardsecurity")
    private String cardSecurity;

    @ManyToOne
    @MapsId
    @JoinColumn(name = "user_iduser")
    private UserAccountEntity user_IDuser;

    public Long getIdCard() {
        return idCard;
    }

    public void setIdCard(Long idCard) {
        this.idCard = idCard;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getCardHolderName() {
        return cardHolderName;
    }

    public void setCardHolderName(String cardHolderName) {
        this.cardHolderName = cardHolderName;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardSecurity() {
        return cardSecurity;
    }

    public void setCardSecurity(String cardSecurity) {
        this.cardSecurity = cardSecurity;
    }

    public UserAccountEntity getUser_IDuser() {
        return user_IDuser;
    }

    public void setUser_IDuser(UserAccountEntity user_IDuser) {
        this.user_IDuser = user_IDuser;
    }


}
