package com.xworkz.real_estate_app.dto;

import lombok.*;
import org.springframework.lang.NonNull;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "audit_table")
@Getter
@Setter
@NoArgsConstructor
@RequiredArgsConstructor
public class AuditDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "audit_id")
    private int auditId;

    @Column(name = "created_by")
    private String createdBy;

    @Column(name = "created_on")
    private LocalDateTime createdOn;

    @Column(name = "updated_by")
    private String updatedBy;

    @Column(name = "updated_on")
    private LocalDateTime updatedOn;

    @NonNull
    @OneToOne(mappedBy = "audit")
    @JoinColumn(name = "audit_id",referencedColumnName = "audit_id")
    private UserDTO userDTO;

}
