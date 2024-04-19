package com.xworkz.real_estate_app.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
@Table(name = "property")
@Getter
@Setter
@ToString
@NamedQueries(
        {
                @NamedQuery(name = "getAllProps",query = "select p from PropertyDTO p")
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id",nullable = false)
    private UserDTO user;


    @OneToMany(cascade = CascadeType.ALL,mappedBy = "property",orphanRemoval = true)
    private List<BiddDTO> bids;

}
