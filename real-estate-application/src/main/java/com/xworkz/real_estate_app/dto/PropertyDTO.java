package com.xworkz.real_estate_app.dto;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
@Table(name = "property")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@NamedQueries(
        {
                @NamedQuery(name = "getAllPropsToBid",query = "SELECT p FROM PropertyDTO p WHERE p.user != :currUser"),
                @NamedQuery(name = "setPropertyStatus",query = "UPDATE PropertyDTO p " +
                        "SET p.propertyStatus = 'SOLD' WHERE p.propertyId = :pId")
        }
)
public class PropertyDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "property_id")
    private Integer propertyId;
    @Column(name = "property_type")
    private String propertyType;
    @Column(name = "property_dimensions")
    private String dimensions;
    @Column(name = "property_value")
    private Long propertyValue;
    @NotNull(message = "* Location cannot be null")
    @Column(name = "property_location")
    private String propertyLocation;

    @Column(name = "property_status")
    private String propertyStatus;

    @ManyToOne
    @JoinColumn(name = "owner_id",nullable = false)
    private UserDTO user;

    @OneToMany(cascade = CascadeType.ALL,mappedBy = "property",orphanRemoval = true)
    private List<BiddDTO> bids;

    @OneToOne(mappedBy = "property")
    private SoldBoughtDTO soldBoughtDTO;

}
