package com.xworkz.real_estate_app.dto;

import lombok.*;
import org.springframework.web.bind.annotation.RequestParam;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "bid_table")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public class BiddDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bid_id")
    private Integer bidId;

    @NotNull(message = "* Bidding amount cannot be null")
    @Column(name = "bid_amount")
    private Long bidAmount;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "fk_user_id")
    private UserDTO userBid;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "fk_property_id",nullable = false)
    private PropertyDTO property;

}
