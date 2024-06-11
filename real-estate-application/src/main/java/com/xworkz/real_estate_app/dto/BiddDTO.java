package com.xworkz.real_estate_app.dto;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "bid_table")
@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NamedQueries({
        @NamedQuery(name = "getUserPropertiesToSell",query = "SELECT b FROM BiddDTO b JOIN PropertyDTO p" +
                " ON p.propertyId = b.property WHERE p.user = :userId AND p.propertyStatus = 'FOR-SALE' ORDER BY b.bidAmount DESC")
})
public class BiddDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bid_id")
    private Integer bidId;

    @NotNull(message = "* Bidding amount cannot be null")
    @Column(name = "bid_amount")
    private Long bidAmount;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "bidder_id")
    private UserDTO userBid;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "bid_property_id",nullable = false)
    private PropertyDTO property;

    @OneToOne(mappedBy = "bid")
    private SoldBoughtDTO soldBought;

}
