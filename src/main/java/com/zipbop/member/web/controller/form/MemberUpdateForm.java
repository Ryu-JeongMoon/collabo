package com.zipbop.member.web.controller.form;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberUpdateForm {

    private String id;

    @NotBlank
    @Pattern(regexp = "^[\\w]{4,20}$")
    private String password;

    @NotBlank
    @Pattern(regexp = "[가-힣a-zA-Z]{2,20}$")
    private String name;

    @Range(min = 12, max = 120)
    private int age;

    @NotBlank
    @Pattern(regexp = "^01(\\d{8,9})$", message = "10 ~ 11 자리의 숫자만 입력 가능합니다.")
    private String phone;

    @NotBlank
    @Pattern(regexp = "^[가-힣a-zA-Z ]{10,200}$")
    private String address;

    @Email
    @NotBlank
    @Pattern(regexp = "(?i)^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$")
    private String email;

    private String license;
}
