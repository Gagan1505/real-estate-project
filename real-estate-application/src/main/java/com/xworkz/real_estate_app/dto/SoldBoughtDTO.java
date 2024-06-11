package com.xworkz.real_estate_app.dto;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "sold_and_bought")
@Getter
@Setter
@NamedQueries({
        @NamedQuery(name = "propertiesSoldByUser",query = "SELECT s FROM SoldBoughtDTO s" +
                " WHERE s.seller = :seller"),
        @NamedQuery(name = "propertiesBuyedByUser",query = "SELECT s FROM SoldBoughtDTO s" +
                " WHERE s.buyer = :buyer")
})

public class SoldBoughtDTO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sold_id")
    private Integer soldId;
    @Column(name = "date")
    private LocalDateTime boughtOrSoldOn;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "seller_id")
    private UserDTO seller;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "buyer_id")
    private UserDTO buyer;

    @OneToOne
    @JoinColumn(name = "property_id")
    private PropertyDTO property;

    @OneToOne
    @JoinColumn(name = "bid_id")
    private BiddDTO bid;
    
}
