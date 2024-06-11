package com.xworkz.real_estate_app.dto;

import lombok.*;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.OnDelete;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.web.context.annotation.SessionScope;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "estate_user")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
@NamedQueries(
        {
                @NamedQuery(name = "userByEmail",query = "select u from UserDTO u where u.userEmailId=:email"),
                @NamedQuery(name = "allEmails",query = "select u.userEmailId from UserDTO u" ),
                @NamedQuery(name = "allPhones",query = "select u.userPhoneNumber from UserDTO u"),
                @NamedQuery(name = "adhaarCount",query = "select count(u) from UserDTO u where u.userAdhaar=:adhaar"),
                @NamedQuery(name = "panCount",query = "select count(u) from UserDTO u where u.userPanCard=:pan"),
                @NamedQuery(name = "getUserOtpCount",query = "select u.otpCount from UserDTO u where u.userEmailId=:email"),
                @NamedQuery(name = "getUserDeactivatedTime",query = "select u.userDeactivatedTime from UserDTO u where u.userEmailId=:email"),
                @NamedQuery(name = "updateUserById",query = "update UserDTO u set " +
                        "u.userFirstName = :firstName," +
                        "u.userLastName = :lastName," +
                        "u.userEmailId = :email," +
                        "u.userPhoneNumber = :phone," +
                        "u.userAdhaar = :adhaar," +
                        "u.userPanCard = :pan," +
                        "u.userCurrentAddress = :current," +
                        "u.userPermanentAddress = :permanent " +
                        "where u.userId = :id"),
                @NamedQuery(name = "updateAudit",query = "update AuditDTO a set " +
                        "a.updatedBy = :ub," +
                        "a.updatedOn = :uo " +
                        "where a.id in (select u.userId from UserDTO u where u.userId = :id)"),
                @NamedQuery(name = "deleteUserInfo",query = "delete from UserDTO u where u.userId = :userId")
        }
)
public class UserDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Integer userId;

    @NotNull(message = "* First name cannot be null")
    @Size(min = 3,max = 20,message = "First name should be of size 3 to 20")
    @Column(name = "user_first_name")
    private String userFirstName;

    @NotNull(message = "* Last name cannot be null")
    @Size(min = 1,max = 20,message = "Last name should contain 1 to 20 characters")
    @Column(name = "user_last_name")
    private String userLastName;

    @NotNull(message = "* Email id is required")
    @Column(name = "user_emailId",unique = true)
    private String userEmailId;

    @Digits(integer = 10,fraction = 0,message = "*Phone number should be 10 numbers only")
    @NotNull(message = "* Phone number is required")
    @Column(name = "user_phone",unique = true)
    private Long userPhoneNumber;

    @NotNull(message = "* Adhaar must not be empty")
    @Digits(integer = 12,fraction = 0,message = "*Adhaar number must be 12 digits")
    @Column(name = "user_adhaar",unique = true)
    private Long userAdhaar;

    @NotNull(message = "* Pan Details are necessary")
    @Size(min = 10,max = 10,message = "* pan should be 10 characters")
    @Column(name = "user_panCard",unique = true)
    private String userPanCard;

    @NotNull(message = "* Address cannot be null")
    @Column(name = "user_current_address")
    private String userCurrentAddress;

    @NotNull(message = "* Permanent Address cannot be empty")
    @Column(name = "user_permanent_address")
    private String userPermanentAddress;

//    @NotNull(message = "* Password cannot be null")
//    @Size(min = 3,max = 15,message = "* Password must be between 3 to 15 characters only")
    @Column(name = "user_password")
    private String userPassword;

    @Column(name = "user_otp")
    private String userOtp;

    @Column(name = "otp_timestamp")
    private LocalDateTime otpTimeStamp;

    @Column(name = "registered_on")
    private LocalDateTime registeredOn;

    @OneToOne(cascade = CascadeType.ALL)
    @Cascade(value = org.hibernate.annotations.CascadeType.DELETE)
    @JoinColumn(name = "audit_id",referencedColumnName = "audit_id")
    private AuditDTO audit;

    @Column(name = "user_otp_count")
    private Integer otpCount;

    @Column(name = "user_deactivated_time")
    private LocalDateTime userDeactivatedTime;

//    @Column(name = "user_profile_image_path")
//    private String profileImgPath;

    @OneToMany(cascade = CascadeType.ALL,mappedBy = "user",orphanRemoval = true)
    private List<PropertyDTO> properties;

    @OneToMany(cascade = CascadeType.ALL,mappedBy = "userBid",orphanRemoval = true)
    private List<BiddDTO> bids;

//    @OneToMany(mappedBy = "seller")
//    private List<SoldBoughtDTO> sold;
//
//    @OneToMany(mappedBy = "buyer")
//    private List<SoldBoughtDTO> bought;

}
