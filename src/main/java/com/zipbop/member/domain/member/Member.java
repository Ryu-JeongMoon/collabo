package com.zipbop.member.domain.member;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

@Data
@Entity
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "member_uuid_seq")
    @SequenceGenerator(name = "member_uuid_seq", sequenceName = "member_uuid_seq", allocationSize = 1)
    private Long uuid;

    @NotBlank
    private String id;

    @NotBlank
    private String password;

    @NotBlank
    private String name;

    private int age;

    @NotBlank
    private String phone;

    private String address;

    @Email
    private String email;

    @Enumerated(EnumType.STRING)
    private Available available;
    private String license;
    private LocalDateTime signupDate;
    private LocalDateTime signoutDate;

}
