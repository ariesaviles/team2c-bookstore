package com.SpringBootApp.CSCI4050.BookStore.entities;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;

import javax.persistence.*;
import java.sql.Date;

@Entity(name = "card")
public class CardEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idcard")
    private Long idCard;

    @Column(name = "cardtype")
    private String cardType;

    @Column(name = "username")
    private Date expirationDate;

    @ManyToOne
    @MapsId
    @JoinColumn(name = "user_iduser")
    private int user_IDuser;

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

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public int getUser_IDuser() {
        return user_IDuser;
    }

    public void setUser_IDuser(int user_IDuser) {
        this.user_IDuser = user_IDuser;
    }
}
