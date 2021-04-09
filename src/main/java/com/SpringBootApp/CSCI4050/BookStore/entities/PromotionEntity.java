package com.SpringBootApp.CSCI4050.BookStore.entities;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;

import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

@Entity(name = "promotion")
public class PromotionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idpromotion")
    private Long idPromotion;

    @Column(name = "discount")
    private Double discount;

    @Column(name = "datestart")
    private Date dateStart;

    @Column(name = "dateend")
    private Date dateEnd;

    @ManyToMany(cascade = { CascadeType.ALL })
    @JoinTable(
            name = "promotion_has_books",
            joinColumns = @JoinColumn(name = "promotion_idpromotion", referencedColumnName = "idpromotion"),
            inverseJoinColumns = @JoinColumn(name = "book_isbn", referencedColumnName = "id")
    )
    private Set<BookEntity> books;

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
}
