package com.SpringBootApp.CSCI4050.BookStore.entities;

import javax.persistence.*;
import java.sql.Date;

@Entity(name = "promotion")
public class PromotionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idpromotion")
    private Long idPromotion;

    @Column(name = "promocode")
    private String promocode;

    @Column(name = "discount")
    private Double discount;

    @Column(name = "datestart")
    private Date dateStart;

    @Column(name = "dateend")
    private Date dateEnd;

    @Column(name = "hasbeensent")
    private int hasSent;

//    @ManyToMany(cascade = { CascadeType.ALL })
//    @JoinTable(
//            name = "promotion_has_books",
//            joinColumns = @JoinColumn(name = "promotion_idpromotion"),
//            inverseJoinColumns = @JoinColumn(name = "book_isbn", referencedColumnName = "isbn")
//    )
//    private Set<BookEntity> books;

    public String getPromocode() {
        return promocode;
    }

    public void setPromocode(String promocode) {
        this.promocode = promocode;
    }
    public Long getIdPromotion() {
        return idPromotion;
    }

    public void setIdPromotion(Long idPromotion) {
        this.idPromotion = idPromotion;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public int getHasSent() {
        return hasSent;
    }

    public void setHasSent(int hasSent) {
        this.hasSent = hasSent;
    }
}
