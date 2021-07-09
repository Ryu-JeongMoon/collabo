package com.zipbop.member.web.login;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
public class LoginForm {

    @NotBlank
    @Pattern(regexp = "^[\\w]{4,20}$")
    private String id;

    @NotBlank
    @Pattern(regexp = "^[\\w]{4,20}$")
    private String password;
}
